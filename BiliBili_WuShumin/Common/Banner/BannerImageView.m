//
//  BannerImageView.m
//  AGCircularScrollView
//
//  Created by 吴书敏 on 16/2/25.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "BannerImageView.h"
#import "UIImageView+WebCache.h"
#import "BannerImage.h"

@implementation BannerImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.userInteractionEnabled = YES; // 打开用户交互
    }
    
    return self;
}


#pragma mark-
#pragma mark 重写modelset方法，设置网络图片
- (void)setBannerImage:(BannerImage *)bannerImage
{
    _bannerImage = bannerImage;
    
    [self sd_setImageWithURL:[NSURL URLWithString:bannerImage.image] placeholderImage:[UIImage imageNamed:@"main_banner"]]; // 设置图片
    
}


// 当点击结束时，让 controller 进入先关界面
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 把被点击图片的信息传递过去
    if (_delegate && [_delegate respondsToSelector:@selector(pushViewControllerWithBannerImage:)]) {
        [_delegate pushViewControllerWithBannerImage:self.bannerImage];
        
        // 停止计时器
        
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
