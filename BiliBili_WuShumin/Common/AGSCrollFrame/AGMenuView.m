//
//  AGMenuView.m
//  FBLViewController
//
//  Created by 吴书敏 on 16/2/13.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "AGMenuView.h"

@implementation AGMenuView

// 重写滚动时触摸点分发方法
- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
    return NO;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
