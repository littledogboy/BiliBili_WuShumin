//
//  FindResultSeasonCollectionViewCell.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/27.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "FindResultSeasonCollectionViewCell.h"
#import "FindSeason.h"

@interface FindResultSeasonCollectionViewCell ()

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *seasonTitleLabel;
@property (nonatomic, strong) UILabel *descLabel;

@end

@implementation FindResultSeasonCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    // cover
    self.coverImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _coverImageView.layer.cornerRadius = 3;
    _coverImageView.layer.masksToBounds = YES;
    _coverImageView.image = CellDefaltImage;
    _coverImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_coverImageView];
    [_coverImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self.contentView);
        make.width.equalTo(_coverImageView.height).multipliedBy(182 / 244.0);
    }];
    
    // title
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.coverImageView.right).offset(14);
        make.right.lessThanOrEqualTo(self.contentView.right).offset(-12);
        make.top.equalTo(self.coverImageView.top).offset(22);
        make.height.equalTo(13);
    }];
    
    //  seasonTitle
    self.seasonTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _seasonTitleLabel.textAlignment = NSTextAlignmentLeft;
    _seasonTitleLabel.font = [UIFont systemFontOfSize:11];
    _seasonTitleLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_seasonTitleLabel];
    [_seasonTitleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.bottom).offset(11);
        make.left.width.equalTo(self.titleLabel);
        make.height.equalTo(@(11));
    }];
    
    // desc
    self.descLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _descLabel.textAlignment = NSTextAlignmentLeft;
    _descLabel.font = [UIFont systemFontOfSize:11];
    _descLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_descLabel];
    [_descLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.seasonTitleLabel.bottom).offset(11);
        make.left.width.height.equalTo(self.seasonTitleLabel);
    }];

}

- (void)setSeason:(FindSeason *)season {
    if (_season != season) {
        _season = season;
        // 赋值
        [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:season.cover]];
        self.titleLabel.text = season.title;
        NSString *string = [NSString stringWithFormat:@"%@ %lu话全", season.newestSeason, season.totalCount];
        self.seasonTitleLabel.text = string;
        self.descLabel.text = season.catDesc;
    }
}

+ (CGFloat)cellHeight {
    return 122;
}

@end
