//
//  LiveViewCell.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/31.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Live;

@interface LiveViewCell : UICollectionViewCell

@property (nonatomic, assign) BOOL isHiddrenAreaButton;

@property (nonatomic, strong) Live *live;

+ (CGSize )sizeOfLiveViewCell;
+ (CGSize)sizeOfLiveViewBannerCell;

@end
