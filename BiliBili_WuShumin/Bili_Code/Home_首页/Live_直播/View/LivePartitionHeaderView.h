//
//  LivePartitionHeaderView.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/27.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LivePartition_Partition;

@interface LivePartitionHeaderView : UICollectionReusableView

@property (nonatomic, strong) LivePartition_Partition *partition;

+ (CGSize )sizeOfPartitionHeaderView;

@end
