//
//  AGTagListView.h
//  AGTagListView
//
//  Created by 吴书敏 on 17/2/5.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AGTagListViewDelegate <NSObject>

- (void)didSelectedTagListCell:(NSInteger )selectedIndex;

@end

@interface AGTagListView : UIView

@property (nonatomic, strong) UICollectionView *collectionView;


@property (nonatomic, strong) NSMutableArray *tagsArray; // cell 数据

// 控制外观
@property (nonatomic, strong) UIColor *titleColor; // 字体颜色
@property (nonatomic, strong) UIColor *tagBgColor; // 背景颜色
@property (nonatomic, assign) CGFloat cornerRadius; // 圆角

// 选中后执行block
@property (nonatomic, copy) void(^tagDidSelectedBlock)(NSString *tagTitle);


@end
