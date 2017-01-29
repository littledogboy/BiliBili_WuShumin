//
//  FindResultUPCollectionViewCell.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/28.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "FindResultUPCollectionViewCell.h"
#import "FindUP.h"

@interface FindResultUPCollectionViewCell ()

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *titleLabel; // up名
@property (nonatomic, strong) UILabel *fansLabel; // 粉丝数
@property (nonatomic, strong) UILabel *archivesLabel; // 视频数
@property (nonatomic, strong) UILabel *signLabel; // 签名

@end

@implementation FindResultUPCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    // cover
    self.coverImageView = [[UIImageView alloc] initWithImage:CellDefaltImage];
    _coverImageView.layer.cornerRadius = 35;
    _coverImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:_coverImageView];
    [_coverImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView);
        make.size.equalTo(CGSizeMake(70, 70));
    }];
    
    // title
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_coverImageView.top);
        make.left.equalTo(_coverImageView.right).offset(12);
        make.height.equalTo(@(13));
        make.right.equalTo(self.contentView.right).offset(-12);
    }];
    
    // fans
    self.fansLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _fansLabel.textAlignment = NSTextAlignmentLeft;
    _fansLabel.font = [UIFont systemFontOfSize:11];
    _fansLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_fansLabel];
    [_fansLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel);
        make.top.equalTo(_titleLabel.bottom).offset(10);
        make.width.equalTo(_titleLabel.width).multipliedBy(0.5);
        make.height.equalTo(@(11));
    }];
    
    // archives
    self.archivesLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _archivesLabel.textAlignment = NSTextAlignmentLeft;
    _archivesLabel.font = [UIFont systemFontOfSize:11];
    _archivesLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_archivesLabel];
    [_archivesLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.fansLabel.right);
        make.top.height.width.equalTo(self.fansLabel);
    }];
    
    // sign
    self.signLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _signLabel.textAlignment = NSTextAlignmentLeft;
    _signLabel.font = [UIFont systemFontOfSize:11];
    _signLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_signLabel];
    [_signLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fansLabel.bottom).offset(10);
        make.left.width.equalTo(self.titleLabel);
        make.height.equalTo(self.fansLabel);
    }];
}

- (void)setUp:(FindUP *)up {
    if (_up != up) {
        _up = up;
        // setdata
        [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:up.cover] placeholderImage:[UIImage imageNamed:@"cell_Default"]];
        self.titleLabel.text = up.title;
        self.fansLabel.text = [NSString stringWithFormat:@"粉丝：%@", [NSString stringOfCount:up.fans]];
        self.archivesLabel.text = [NSString stringWithFormat:@"视频：%@", [NSString stringOfCount:up.archives]];
        self.signLabel.text = up.sign;
    }
}

+ (CGFloat)cellHeight {
    return 70;
}

@end
