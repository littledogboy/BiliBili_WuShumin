//
//  FindSearchResultCompositeCollectionViewCell.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 17/1/3.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import "FindSearchResultCompositeCollectionViewCell.h"
#import "FindArchive.h"

@interface FindSearchResultCompositeCollectionViewCell ()

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UILabel *playLabel;
@property (nonatomic, strong) UILabel *danmakuLabel;
@property (nonatomic, strong) UILabel *durationLabel;

@end

@implementation FindSearchResultCompositeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupSubViews];
    }
    
    return self;
}

- (void)setupSubViews {
    // cover
    self.coverImageView = [[UIImageView alloc] initWithImage:CellDefaltImage];
    _coverImageView.layer.cornerRadius = 5.0;
    _coverImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:_coverImageView];
    [_coverImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView);
        make.size.equalTo(CGSizeMake(122, 75));
    }];
    
    // title
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.font = [UIFont systemFontOfSize:13];
    _titleLabel.numberOfLines = 0;
    [self.contentView addSubview:_titleLabel];
    [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverImageView);
        make.left.equalTo(self.coverImageView.right).offset(12);
        make.right.equalTo(self.contentView);
        make.height.greaterThanOrEqualTo(@(13));
        make.height.lessThanOrEqualTo(@(32));
    }];

    // author
    self.authorLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _authorLabel.textAlignment = NSTextAlignmentLeft;
    _authorLabel.font = [UIFont systemFontOfSize:11];
    _authorLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_authorLabel];
    [_authorLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.with.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.bottom).offset(8);
        make.height.equalTo(@(11));
    }];

    // play
    self.playLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _playLabel.textAlignment = NSTextAlignmentLeft;
    _playLabel.font = [UIFont systemFontOfSize:11];
    _playLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_playLabel];
    [_playLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.authorLabel.bottom).offset(8);
        make.left.height.equalTo(self.authorLabel);
        make.width.equalTo(self.authorLabel).multipliedBy(0.5);
    }];

    // danmu
    self.danmakuLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _danmakuLabel.textAlignment = NSTextAlignmentRight;
    _danmakuLabel.font = [UIFont systemFontOfSize:11];
    _danmakuLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_danmakuLabel];
    [_danmakuLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.height.equalTo(self.playLabel);
        make.right.equalTo(self.contentView);
    }];

    // duration
    self.durationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _durationLabel.backgroundColor = RGBACOLOR(0, 0, 0, 0.5);
    _durationLabel.layer.cornerRadius = 3.0;
    _durationLabel.layer.masksToBounds = YES;
    _durationLabel.textAlignment = NSTextAlignmentCenter;
    _durationLabel.font = [UIFont systemFontOfSize:11];
    _durationLabel.textColor = [UIColor whiteColor];
    [self.coverImageView addSubview:_durationLabel];
    [_durationLabel makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self.coverImageView).offset(-5);
        make.height.equalTo(@(13.5));
    }];
}

- (void)setArchive:(FindArchive *)archive {
    if (_archive != archive) {
        _archive = archive;
        
        //
        //
        [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:archive.cover]];
        self.titleLabel.text = archive.title;
        self.authorLabel.text = [NSString stringWithFormat:@"UP主：%@", archive.author];
        self.playLabel.text = [NSString stringWithFormat:@"播放：%@", [NSString stringOfCount:archive.play]];
        self.danmakuLabel.text = [NSString stringWithFormat:@"弹幕：%@", [NSString stringOfCount:archive.danmaku]];
        self.durationLabel.text = [NSString stringWithFormat:@" %@ ", [NSString durationOfString:archive.duration]];
    }
}


+ (CGFloat)cellHeight {
    return 75;
}

@end


















