//
//  FindResultUPCollectionViewCell.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/28.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FindUP;

@interface FindResultUPCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) FindUP *up;

+ (CGFloat)cellHeight;

@end
