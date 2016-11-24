//
//  UIButton+AGFillColor.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/11/23.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "UIButton+AGFillColor.h"

@implementation UIButton (AGFillColor)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    [self setBackgroundImage:[UIButton imageWithColor:backgroundColor] forState:state];
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1); // 1 * 1 的点
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
