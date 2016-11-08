//
//  AGRefreshViewTwo.h
//  检测CollectionView的ContentView
//
//  Created by 吴书敏 on 16/11/2.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

// 下拉过程
typedef NS_ENUM(NSUInteger, RefreshState)
{
    RefreshStateNormal,
    RefreshStatePulling,
    RefreshStateRefreshing,
    RefreshStateDone
};


@interface AGRefreshViewTwo : UIView

// 初始化方法
- (instancetype)initWithFrame:(CGRect)frame block:(void (^)())block scrollView:(UIScrollView *)scrollView;


// 结束刷新
- (void)endRefresh;




@end


#pragma mark- UIScrollView 分类

@interface UIScrollView (RefreshView)

// 添加属性
@property (nonatomic, strong) AGRefreshViewTwo *refreshView;

// 添加下拉刷新视图，以及 刷新时的block
- (void)addRefreshViewWithFrame:(CGRect)frame refreshingBlock:(void (^)())block;

@end

#pragma mark- UIImageView 分类
@interface UIImageView (addAnimationImages)

- (void)addAnimationImagesWithFirstImageName:(NSString *)firstImageName type:(NSString *)type duration:(CGFloat)duration;

@end

