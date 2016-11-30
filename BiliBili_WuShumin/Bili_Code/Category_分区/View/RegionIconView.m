//
//  RegionIconView.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/11/25.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "RegionIconView.h"

@interface RegionIconView ()

@property (nonatomic, strong) UIImageView *borderImageView;

@end

@implementation RegionIconView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // borderImageView
        self.borderImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"region_border"]];
        [self addSubview:_borderImageView];
        WS(ws);
        [_borderImageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws);
            make.left.equalTo(ws);
            make.width.equalTo(@(76));
            make.height.equalTo(@(72));
        }];
        
        // iconImageView
        self.iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"region_icon_0_live_0"]];
        [self.borderImageView addSubview:_iconImageView];
        [_iconImageView makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(ws.borderImageView);
            make.size.equalTo(ws.borderImageView).multipliedBy(0.5);
        }];
        
        // iconNameLabel
        self.iconNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _iconNameLabel.textAlignment = NSTextAlignmentCenter;
        _iconNameLabel.font = [UIFont systemFontOfSize:13];
        _iconNameLabel.text = @"直播";
        [self addSubview:_iconNameLabel];
        [_iconNameLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws.borderImageView.bottom);
            make.width.equalTo(ws.borderImageView.width);
            make.centerX.equalTo(ws.borderImageView.centerX);
        }];
        
}
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame iconImage:(UIImage *)iconImage iconName:(NSString *)iconName {
    self = [self initWithFrame:frame];
    if (self) {
        self.iconImageView.image = iconImage;
        self.iconNameLabel.text = iconName;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
