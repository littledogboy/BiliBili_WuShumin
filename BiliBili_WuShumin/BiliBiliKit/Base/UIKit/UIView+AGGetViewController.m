//
//  UIView+AGGetViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/11/24.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "UIView+AGGetViewController.h"

@implementation UIView (AGGetViewController)

- (UIViewController *)getCurrentViewController {
    UIResponder *next = [self nextResponder];
    while (next != nil) {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    }
    return nil;
}


@end
