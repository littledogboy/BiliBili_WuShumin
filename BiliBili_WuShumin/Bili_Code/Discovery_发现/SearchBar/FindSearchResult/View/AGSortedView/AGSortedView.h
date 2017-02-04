//
//  AGSortedView.h
//  AGSortedView
//
//  Created by 吴书敏 on 17/2/1.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGSortedView : UIView

@property (nonatomic, strong) NSArray<NSArray *> *titlesArray; // 存放标题数组的数组

@property (nonatomic, strong) NSMutableArray *selectedIndexArray; // 存放选中下标数组

@property (nonatomic, copy) void(^didSelectedTitleBlock)(NSArray *array); // 选中按钮后执行block

@end
