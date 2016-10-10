//
//  UIViewController+AGGetViewController.h
//  URLRooter
//
//  Created by 吴书敏 on 16/10/9.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AGGetViewController)

// 获取根视图控制器
+ (UIViewController *)rootViewController;

// 获取当前导航控制器
+ (UINavigationController *)currentNavigationViewController;

// 获取当前控制器
+ (UIViewController *)currentViewController;

@end
