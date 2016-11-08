//
//  UIView+CornerRadius.h
//  检测CollectionView的ContentView
//
//  Created by 吴书敏 on 16/11/2.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CornerRadius)

/**
 *  设置不同方向的圆角
 *
 *  @param rectCorner   圆角类型 | 圆角类型
 *  @param cornerRadius 圆角半径
 */
- (void)rectCorner:(UIRectCorner)rectCorner withCornerRadius:(CGFloat)cornerRadius;

@end
