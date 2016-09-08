//
//  BannerImageView.h
//  AGCircularScrollView
//
//  Created by 吴书敏 on 16/2/25.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BannerImage;

// 协议当点击滚动图的时候执行。
@protocol BannerImageViewDelegate <NSObject>

- (void)pushViewControllerWithBannerImage:(BannerImage *)bannerImage;

@optional
- (void)popViewController;

@end


@class BannerImage;

@interface BannerImageView : UIImageView

// 存储model
@property (nonatomic, copy) BannerImage *bannerImage;

// 代理
@property (nonatomic, assign) id<BannerImageViewDelegate> delegate;

@end
