//
//  FindResultSPCollectionViewCell.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/29.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "FindResultSPCollectionViewCell.h"
#import "FindSP.h"

@interface FindResultSPCollectionViewCell ()

//
@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *titleLabel; // 专题名
@property (nonatomic, strong) UILabel *archivesLabel; // 视频数
@property (nonatomic, strong) UILabel *playLabel; // 播放数量
@property (nonatomic, strong) UILabel *descLabel; // 描述

@end

@implementation FindResultSPCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupSubViews];
    }
    
    return self;
}

- (void)setupSubViews {
    // coverImageView
    self.coverImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _coverImageView.image = CellDefaltImage;
    _coverImageView.layer.cornerRadius = 3.0;
    _coverImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:_coverImageView];
    [_coverImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView);
        make.width.height.equalTo(@(70));
    }];
    
    // title
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.font = [UIFont systemFontOfSize:13];
    _titleLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.coverImageView.right).offset(12);
        make.top.equalTo(self.coverImageView.top).offset(12);
        make.height.equalTo(@(13));
        make.right.equalTo(self.contentView.right).offset(-12);
    }];
    
    // archivers
    self.archivesLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _archivesLabel.textAlignment = NSTextAlignmentLeft;
    _archivesLabel.font = [UIFont systemFontOfSize:11];
    _archivesLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_archivesLabel];
    [_archivesLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.left);
        make.top.equalTo(self.titleLabel.bottom).offset(10);
        make.width.equalTo(self.titleLabel.width).multipliedBy(0.5);
        make.height.equalTo(@(11));
    }];
    
    // play
    self.playLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _playLabel.textAlignment = NSTextAlignmentLeft;
    _playLabel.font = [UIFont systemFontOfSize:11];
    _playLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_playLabel];
    [_playLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.height.equalTo(self.archivesLabel);
        make.left.equalTo(self.archivesLabel.right);
    }];
    
    // desc
    self.descLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _descLabel.textAlignment = NSTextAlignmentLeft;
    _descLabel.font = [UIFont systemFontOfSize:11];
    _descLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_descLabel];
    [_descLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.archivesLabel.bottom).offset(10);
        make.left.height.equalTo(self.archivesLabel);
        make.width.equalTo(self.titleLabel);
    }];
}

- (void)setSp:(FindSP *)sp {
    if (_sp != sp) {
        _sp = sp;
        
        [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:sp.cover]];
        self.titleLabel.text = sp.title;
        self.archivesLabel.text = [NSString stringWithFormat:@"视频：%@", [NSString stringOfCount:sp.archives]];
        self.playLabel.text = [NSString stringWithFormat:@"播放：%@", [NSString stringOfCount:sp.play]];
        self.descLabel.text = sp.desc;
    }
}

+ (CGFloat)cellHeight {
    return 70;
}


@end



















