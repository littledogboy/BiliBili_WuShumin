//
//  FindResultMovieCollectionViewCell.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/29.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "FindResultMovieCollectionViewCell.h"
#import "FindMovie.h"

@interface FindResultMovieCollectionViewCell ()

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *lengthLabel; // 影片长度
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *dataLabel; // 影片时间
@property (nonatomic, strong) UILabel *areaLabel; // 地区
@property (nonatomic, strong) UILabel *staffLabel; // 导演
@property (nonatomic, strong) UILabel *actorsLabel; // 演员

@end

@implementation FindResultMovieCollectionViewCell

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
    _coverImageView.layer.cornerRadius = 3.0;
    _coverImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:_coverImageView];
    [_coverImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView);
        make.size.equalTo(CGSizeMake(91, 122));
    }];
    
    // title
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverImageView.top).offset(15);
        make.left.equalTo(self.coverImageView.right).offset(12);
        make.right.lessThanOrEqualTo(self.contentView.right).offset(-40);
        make.height.equalTo(@(13));
    }];
    
    // data
    self.dataLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _dataLabel.textAlignment = NSTextAlignmentLeft;
    _dataLabel.font = [UIFont systemFontOfSize:11];
    _dataLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_dataLabel];
    [_dataLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_titleLabel.centerY);
        make.left.equalTo(_titleLabel.right).offset(10);
        make.right.lessThanOrEqualTo(self.contentView.right).offset(-12);
        make.height.equalTo(@(11));
    }];
    
    // area
    self.areaLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _areaLabel.textAlignment = NSTextAlignmentLeft;
    _areaLabel.font = [UIFont systemFontOfSize:11];
    _areaLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_areaLabel];
    [_areaLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.bottom).offset(10);
        make.left.equalTo(self.titleLabel);
        make.right.equalTo(self.contentView.right).offset(-12);
        make.height.equalTo(@(11));
    }];
    
    // staff
    self.staffLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _staffLabel.textAlignment = NSTextAlignmentLeft;
    _staffLabel.font = [UIFont systemFontOfSize:11];
    _staffLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_staffLabel];
    [_staffLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.areaLabel.bottom).offset(10);
        make.left.width.height.equalTo(self.areaLabel);
    }];
    
    // actor
    self.actorsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _actorsLabel.textAlignment = NSTextAlignmentLeft;
    _actorsLabel.font = [UIFont systemFontOfSize:11];
    _actorsLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_actorsLabel];
    [_actorsLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.staffLabel.bottom).offset(10);
        make.left.width.height.equalTo(self.staffLabel);
    }];
}

- (void)setMovie:(FindMovie *)movie {
    if (_movie != movie) {
        _movie = movie;
        
        [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:movie.cover]];
        self.titleLabel.text = movie.title;
        self.dataLabel.text = [movie.screenDate componentsSeparatedByString:@"-"][0];
        self.areaLabel.text = [NSString stringWithFormat:@"地区：%@", movie.area];
        self.staffLabel.text = [NSString stringWithFormat:@"%@", [movie.staff componentsSeparatedByString:@"⏎"][0]];
        self.actorsLabel.text = [NSString stringWithFormat:@"演员：%@", movie.actors];
    }
}

+ (CGFloat)cellHeight {
    return 122;
}

@end
