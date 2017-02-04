//
//  AGFirstTitleCollectionViewCell.m
//  AGSortedView
//
//  Created by 吴书敏 on 17/2/1.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#define RGBCOLOR(r, g, b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0f]

#define ButtonSelectedColor RGBCOLOR(250, 114, 152)

#define ButtonNormalColor RGBCOLOR(113, 113, 113)



#import "AGFirstTitleCollectionViewCell.h"

@interface AGFirstTitleCollectionViewCell ()

@property (nonatomic, strong) UIImageView *horizonArrowImageView; // 水平箭头
@property (nonatomic, strong) UIImageView *verticalArrowImageView; // 二级页面展开箭头

@end


@implementation AGFirstTitleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    // button
    self.button = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.button.userInteractionEnabled = NO; // 关闭用户交互
    [self.button setTitleColor:ButtonNormalColor forState:(UIControlStateNormal)];
    self.button.titleLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_button];
    [_button makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    // horizonArrow
    self.horizonArrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Find_Archive_DownArrow"]];
    [self addSubview:_horizonArrowImageView];
    [_horizonArrowImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.button.right);
        make.size.equalTo(CGSizeMake(9.5, 10));
        make.centerY.equalTo(self.button);
    }];
    
    // verticalArrow
    self.verticalArrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Find_Archive_SpreadArrow"]];
    _verticalArrowImageView.hidden = YES;
    [self addSubview:_verticalArrowImageView];
    [_verticalArrowImageView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.button);
        make.bottom.equalTo(self);
    }];
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    if (_isSelected) {
        // first class title
        [self.button setTitleColor:ButtonSelectedColor forState:(UIControlStateNormal)];
        self.horizonArrowImageView.image = [UIImage imageNamed:@"Find_Archive_UpArrow"];
        self.verticalArrowImageView.hidden = NO;
        // second class title
    } else {
        [self.button setTitleColor:ButtonNormalColor forState:(UIControlStateNormal)];
        self.horizonArrowImageView.image = [UIImage imageNamed:@"Find_Archive_DownArrow"];
        self.verticalArrowImageView.hidden = YES;
    }
}

@end
