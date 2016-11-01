//
//  LiveHeaderView.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/27.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LivePartition_Partition;

@interface LiveHeaderView : UICollectionReusableView

@property (nonatomic, strong) NSString *imageMapKey;
@property (nonatomic, strong) NSArray *circleViewModelArray;

//model
@property (nonatomic, strong) LivePartition_Partition *partition;

+ (CGSize )sizeOfLiveHeaderView;

@end
