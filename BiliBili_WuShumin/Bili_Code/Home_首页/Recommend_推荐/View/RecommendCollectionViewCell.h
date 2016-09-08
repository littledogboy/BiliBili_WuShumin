//
//  RecommendCollectionViewCell.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/8/26.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Body;

@interface RecommendCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *coverImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIView *midView;
@property (strong, nonatomic) IBOutlet UILabel *playCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *danmukuCountLabel;

@property (nonatomic, strong) Body *body;

@end
