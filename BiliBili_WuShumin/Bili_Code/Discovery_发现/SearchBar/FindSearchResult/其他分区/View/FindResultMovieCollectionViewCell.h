//
//  FindResultMovieCollectionViewCell.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/29.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FindMovie;

@interface FindResultMovieCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) FindMovie *movie;

+ (CGFloat)cellHeight;

@end
