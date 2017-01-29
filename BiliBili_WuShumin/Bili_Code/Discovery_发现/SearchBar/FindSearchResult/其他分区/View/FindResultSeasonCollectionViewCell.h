//
//  FindResultSeasonCollectionViewCell.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/27.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FindSeason;

@interface FindResultSeasonCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) FindSeason *season;

@property (nonatomic, assign) BOOL isTagHidden; // 是否隐藏标识，默认为no

+ (CGFloat )cellHeight;

@end
