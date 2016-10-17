//
//  Bungumi_RecommendCell.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/16.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BungumiRecommend.h"

@interface Bungumi_RecommendCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *coverImageView;
@property (strong, nonatomic) IBOutlet UIImageView *isNewImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descLabel;

// model
@property (nonatomic, strong) BungumiRecommend *recommend;
@end
