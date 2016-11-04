//
//  HomeViewController.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/8/23.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

// topView 顶部背景颜色视图
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIColor *topViewColor;

// 菜单menuView
@property (nonatomic, strong) UIScrollView *menuView;
@property (nonatomic, copy) NSArray *menuTitleArray; // 标题数组
@property (nonatomic, assign) NSInteger selectedIndex; // 选中下标
@property (nonatomic, assign) NSInteger lastSelectedIndex; // 上次选中下标
@property (nonatomic, strong) UIColor *selectedColor; // 标题选中颜色
@property (nonatomic, strong) UIColor *unselectedColor; // 未选中颜色

// 内容contentView
@property (nonatomic, strong) UICollectionView *contentView;

// 滚动条underLineView
@property (nonatomic, strong) UIView *underLineView;
@property (nonatomic, strong) UIColor *underLineColor; // 滚动条颜色
@property (nonatomic, assign) BOOL isHiddrenUnderLine; // 是否显示滚动条

// 子视图控制器
@property (nonatomic, copy) NSArray *viewControllers; // 子视图控制器

@end
