//
//  AGSecondTitleCollectionView.h
//  AGSortedView
//
//  Created by 吴书敏 on 17/2/1.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGSecondTitleCollectionView : UICollectionView

@property (nonatomic, strong) NSArray<NSString *> *titleArray;
@property (nonatomic, assign) BOOL isFirstSread; // 是否第一次展开
@property (nonatomic, assign) BOOL isSpreading; // 是否正在展开
@property (nonatomic, copy) void(^didSelectedCellBlock)(NSNumber *item); // 选中时执行的block
@property (nonatomic, assign)  NSInteger selectedIndex; // 选中下标

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)array;


@end
