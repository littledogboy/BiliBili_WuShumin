//
//  AGSecondTitleCollectionViewCell.m
//  AGSortedView
//
//  Created by 吴书敏 on 17/2/1.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#define RGBCOLOR(r, g, b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0f]

#define ButtonSelectedColor RGBCOLOR(255, 255, 255)

#define ButtonNormalColor RGBCOLOR(113, 113, 113)

#import "AGSecondTitleCollectionViewCell.h"

@interface AGSecondTitleCollectionViewCell ()

@property (nonatomic, strong) UIImageView *bgImageView;

@end


@implementation AGSecondTitleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    self.button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    _button.titleLabel.font = [UIFont systemFontOfSize:13];
    _button.selected = NO;
    _button.userInteractionEnabled = NO;
    [self.contentView addSubview:_button];
    [_button makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
    
    //
    UIImage *bgImage = [[UIImage imageNamed:@"AGSortedView_Button_bg"]resizableImageWithCapInsets:(UIEdgeInsetsMake(12, 8, 12, 8))];
    self.bgImageView = [[UIImageView alloc] initWithImage:bgImage];
    _bgImageView.hidden = YES;
    [self.button insertSubview:_bgImageView belowSubview:_button.titleLabel];
    [_bgImageView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(0, -5, 0, -5));
    }];
    
}

- (void)setSelected:(BOOL)selected {
    _isSelected = selected;
    if (_isSelected) {
        [_button setTitleColor:ButtonSelectedColor forState:(UIControlStateNormal)];
        _bgImageView.hidden = NO;
    } else {
        [_button setTitleColor:ButtonNormalColor forState:(UIControlStateNormal)];
        _bgImageView.hidden = YES;
    }
}




@end
