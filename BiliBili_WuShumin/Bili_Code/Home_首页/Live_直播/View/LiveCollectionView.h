//
//  LiveCollectionView.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/27.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LiveRecommendData;

@interface LiveCollectionView : UICollectionView

@property (nonatomic, strong) NSArray *bannerArray;
@property (nonatomic, strong) NSArray *partionArray;
@property (nonatomic, strong) LiveRecommendData *liveRecommendData;

@end
