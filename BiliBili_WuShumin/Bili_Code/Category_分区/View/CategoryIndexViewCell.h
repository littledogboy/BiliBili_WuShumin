//
//  CategoryIndexViewCell.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/11/30.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CategoryIndexModel;

@interface CategoryIndexViewCell : UICollectionViewCell

//
+ (CategoryIndexViewCell *)dequeueWithCollectionView:(UICollectionView *)collectionView  withIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

// model
@property (nonatomic, strong) CategoryIndexModel *category;

@end
