//
//  Bungumi_PreviousHeaderView.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/16.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "Recommend_RegionHeaderView.h"

@interface Bungumi_PreviousHeaderView : UICollectionReusableView

@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *rightTitleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *arrowImageView;

+ (CGSize )sizeOfBungumi_PreviousHeaderView;

@end
