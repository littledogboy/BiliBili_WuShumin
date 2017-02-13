//
//  BBSCollectionViewCell.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 17/2/8.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import "BBSCollectionViewCell.h"


@interface BBSCollectionViewCell ()

@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UIView *lineView;

@end


@implementation BBSCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = SAKURACOLOR;
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    // tagImageView
    self.tagImageView = [[UIImageView alloc] init];
    _tagImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_tagImageView];
    [_tagImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.centerY.equalTo(self.contentView);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    
    // titleLabel
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tagImageView.right).offset(10);
        make.centerY.equalTo(self.contentView);
    }];
    
    // arrow
    self.arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_rightArrowGray"]];
    [self.contentView addSubview:_arrowImageView];
    [_arrowImageView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-12);
        make.centerY.equalTo(self.contentView);
    }];
    
    // lineView
    self.lineView = [[UIView alloc] initWithFrame:CGRectZero];
    _lineView.backgroundColor = RGBCOLOR(244, 244, 244);
    [self.contentView addSubview:_lineView];
    [_lineView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(15);
        make.right.equalTo(self.contentView);
        make.height.equalTo(@1);
    }];
}

- (void)setIsHiddenLine:(BOOL)isHiddenLine {
    _isHiddenLine = isHiddenLine;
    self.lineView.hidden = isHiddenLine;
}

- (void)setIsShowCornerRadius:(BOOL)isShowCornerRadius {
    _isShowCornerRadius = isShowCornerRadius;
    if (_isShowCornerRadius) {
        [self.contentView rectCorner:(UIRectCornerTopLeft | UIRectCornerTopRight) withCornerRadius:8.0];
    } else {
        [self.contentView rectCorner:(UIRectCornerTopLeft | UIRectCornerTopRight) withCornerRadius:0.0];

    }
}

@end
