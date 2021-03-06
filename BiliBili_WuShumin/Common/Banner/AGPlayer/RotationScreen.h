//
//  RotationScreen.h
//  AGPlayer
//
//  Created by 吴书敏 on 16/8/3.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RotationScreen : NSObject

/**
 *  切换横竖屏
 *
 *  @param orientation UIInterfaceOrientation
 */
+ (void)forceOrientation:(UIInterfaceOrientation)orientation;

+ (void)rotationAnimationOrientation:(UIInterfaceOrientation)orientation withViewController:(UIViewController *)viewController;

/**
 *  是否是横屏
 *
 *  @return 是 返回yes
 */
+ (BOOL)isOrientationLandscape;


/**
 *  是否是竖屏
 */
+ (BOOL)isOrientationPortrait;
@end
