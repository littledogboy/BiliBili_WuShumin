//
//  RotationScreen.m
//  AGPlayer
//
//  Created by 吴书敏 on 16/8/3.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "RotationScreen.h"
#import "AppDelegate.h"

@implementation RotationScreen

/**
 *  旋转有两种方式： 
 *  1 更改设备方向，设置 currentDevice orientation
 *  2. 假旋转，不更改设备方向，更改 view的 transform
 */

//
+ (void)forceOrientation:(UIInterfaceOrientation)orientation {
    // setOrientation: 私有方法强制横屏
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = orientation;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

bool isPortrait = true;
+ (void)rotationAnimationOrientation:(UIInterfaceOrientation)orientation withViewController:(UIViewController *)viewController {
    CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration; // 转90°的时间
    [UIView animateWithDuration:duration animations:^{
        [self forceOrientation:orientation];
    } completion:^(BOOL finished) {
        ((AppDelegate *)[UIApplication sharedApplication].delegate).allowRotaion = YES;
    }];
    
}


//
+ (BOOL)isOrientationLandscape {
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isOrientationPortrait {
    if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
        return YES;
    } else {
        return NO;
    }
}

@end
