//
//  AGScrollFrameController.h
//  FBLViewController
//
//  Created by 吴书敏 on 16/2/13.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGScrollFrameController : UIViewController

// 类型
typedef NS_ENUM(NSUInteger, AGScrollFrameControllerType)
{
    AGScrollFrameControllerTypeDefault,
    AGScrollFrameControllerTypeValue1,
};

// 菜单滚动条的宽度 高度
@property (nonatomic, assign) CGFloat menuWidth;
@property (nonatomic, assign) CGFloat menuHeight;

@property (nonatomic, copy) NSArray *menuTitleArray; // 菜单标题

@property (nonatomic, assign) NSInteger selectedIndex; // button选中下标

// 标题选中颜色
@property (nonatomic, strong) UIColor *titleSelectedColor;
// 标题未选中颜色
@property (nonatomic, strong) UIColor *titleUnSelectedColor;

// 子视图控制器
@property (nonatomic, copy) NSArray *viewControllers;

// 自定义初始化方法

@end
