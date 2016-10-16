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

// 拓展id类型
@property (nonatomic, copy) id bannerImageModel;

// 代理
@property (nonatomic, assign) id<BannerImageViewDelegate> delegate;

/**
 *  注册图片路径映射
 *
 *  @param name 图片链接对应的属性名
 *  注意： 注册要写在 model 赋值的前面
 */
- (void)registerImagePropertyName:(NSString *)name;
// 注册点击跳转属性名

@end
