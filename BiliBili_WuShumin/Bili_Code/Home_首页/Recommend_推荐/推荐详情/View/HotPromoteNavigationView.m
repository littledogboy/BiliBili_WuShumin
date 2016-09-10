//
//  HotPromoteNavigationView.m
//  热门推荐详情页面
//
//  Created by 吴书敏 on 16/6/6.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

// rgb 颜色
#define RGB(r,g,b,a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a]

#import "HotPromoteNavigationView.h"
#import "Masonry.h"
#import <math.h>

@implementation HotPromoteNavigationView

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"KScroll" object:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.statusBar = [[UIView alloc] init];
        [self addSubview:_statusBar];
        [_statusBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self);
            make.height.equalTo(@(20));
            make.top.left.equalTo(@(0));
        }];
        [self setGradientColorWithStartColor:RGB(80, 80, 80, 0.8) endColor:RGB(160, 160, 160, 0.2) view:_statusBar];
        
        self.navigationBar = [[UIView alloc] init];
        [self addSubview:_navigationBar];
        [_navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_statusBar.mas_bottom);
            make.left.equalTo(@(0));
            make.width.equalTo(self);
            make.height.equalTo(@(44));
        }];
        [self setGradientColorWithStartColor:RGB(160, 160, 160, 0.2) endColor:RGB(240, 240, 240, 0.0f) view:_navigationBar];
        
        // titleLabel
        
        // 注册为通知观察者
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollAnimation:) name:@"KScroll" object:nil];
        
    }
    
    return self;
}


- (void)setGradientColorWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor view:(UIView *)view
{
    // init CAGradientLayer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [self layoutIfNeeded]; //   refresh layout rightnow
    gradientLayer.frame = view.layer.frame;
    [self.statusBar.layer addSublayer:gradientLayer];
    
    // set gradient colors
    gradientLayer.colors = @[ (__bridge id)startColor.CGColor,
                              (__bridge id)endColor.CGColor ];
    
    // set star and end point
    gradientLayer.startPoint = CGPointMake(0.5f, 0.0f);
    gradientLayer.endPoint = CGPointMake(0.5f, 1.0f);
    
    // optional set locations
}


// leftButton
- (void)setLeftButton:(UIButton *)leftButton
{
    if (_leftButton != leftButton) {
        _leftButton = leftButton;
        [self.navigationBar addSubview:_leftButton];
        [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.navigationBar).offset(15);
            make.centerY.equalTo(self.navigationBar);
            make.width.height.equalTo(@(25));
        }];
    }
}

// titleLabel
- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textColor = [UIColor whiteColor];
        [self.navigationBar addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_leftButton.mas_centerY);
            make.centerX.greaterThanOrEqualTo(self);
            make.height.equalTo(@(12));
        }];
    }
    return _titleLabel;
}


#pragma mark-
#pragma mark 通知触发方法

- (void)scrollAnimation:(NSNotification *)notification
{
    CGFloat star = 0;
    CGFloat end  = 210 - 64;
    CGFloat mid  = (end - star) / 2.0;
    
    // 1. get the offSet
    NSNumber *contentOffsetY = [[notification userInfo] valueForKey:@"contentOffsetY"];
    CGFloat offsetY = [contentOffsetY floatValue];
    
    if ( offsetY > star && offsetY < end) {
        // 2. change alpha
        CGFloat radius = 90/73.0 * offsetY * M_PI / 180;
        CGFloat cosValue = cos(radius);
        CGFloat alpha =  fabs(cosValue);
        self.titleLabel.alpha = alpha;
        
        // 3. change position
        CGFloat fromX = self.frame.size.width / 2.0;
        CGFloat toX = self.frame.size.width / 2.0 + self.titleLabel.frame.size.width / 2.0;
        
        CGFloat k = (toX - fromX) / end;
        CGFloat c = fromX;
        CGFloat timeX = offsetY * k;
        [_titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(@(timeX));
        }];
//        NSLog(@"%.2f", timeX);
    }
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
