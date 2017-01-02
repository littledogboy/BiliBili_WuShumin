//
//  FindSearchResultCompositeCollectionViewCell.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 17/1/3.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FindArchive;

@interface FindSearchResultCompositeCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) FindArchive *archive;

+ (CGFloat)cellHeight;

@end
