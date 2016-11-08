//
//  UIView+CornerRadius.m
//  检测CollectionView的ContentView
//
//  Created by 吴书敏 on 16/11/2.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "UIView+CornerRadius.h"

@implementation UIView (CornerRadius)

- (void)rectCorner:(UIRectCorner)rectCorner withCornerRadius:(CGFloat)cornerRadius {
    // 1. cornerSize
    CGSize cornerSize = CGSizeMake(cornerRadius, cornerRadius);
    // 2. bezerPath
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:rectCorner
                                                         cornerRadii:cornerSize];
    // 3. shapeLayer
    // set frame path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    
    // 4. setMasksToBounds
    self.layer.mask = maskLayer;
}

@end
