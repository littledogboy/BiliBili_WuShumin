//
//  LiveCollectionView.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/27.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGRefreshCollectionView.h"
#import "LiveData.h"

@class LiveRecommendData;


@interface LiveCollectionView : AGRefreshCollectionView

@property (nonatomic, strong) NSArray *bannerArray;
@property (nonatomic, strong) NSArray *partionArray;
@property (nonatomic, strong) LiveRecommendData *liveRecommendData;

// cell 被点击时
@property (nonatomic, copy) void (^handleDidSelectedItem)(Live *live);

// 区头区尾被点击时

// 刷新按钮

@end
