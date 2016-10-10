//
//  UIViewController+AGGetViewController.m
//  URLRooter
//
//  Created by 吴书敏 on 16/10/9.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "UIViewController+AGGetViewController.h"

@implementation UIViewController (AGGetViewController)

// 获取应用代理
+ (id<UIApplicationDelegate>)applicationDelegate {
    return [UIApplication sharedApplication].delegate;
}

// 获取根视图控制器
+ (UIViewController *)rootViewController {
    return self.applicationDelegate.window.rootViewController;
}

// 获取当前正在显示的控制器
+ (UIViewController *)currentViewController {
    // 从根视图控制器，递推，获取当前正在显示的控制器
    return [self currentViewControllerFrom:self.rootViewController];
}

// 获取导航控制器
+ (UINavigationController *)currentNavigationViewController {
    return self.currentViewController.navigationController;
}

#pragma mark- 核心递归查询
+ (UIViewController *)currentViewControllerFrom:(UIViewController *)viewController {
    // 导航控制器，递推，栈顶控制器
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)viewController;
        return [self currentViewControllerFrom:navigationController.viewControllers.lastObject];
        
    // 标签控制器，递推，选中控制器
    } else if ([viewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)viewController;
        return [self currentViewControllerFrom:tabBarController.selectedViewController];
        
    // 模态控制器不为空, 递推，模态控制器
    } else if (viewController.presentedViewController != nil) {
        return [self currentViewControllerFrom:viewController.presentedViewController];
        
    // 返回控制器本身
    } else {
        return viewController;
    }
}

@end
