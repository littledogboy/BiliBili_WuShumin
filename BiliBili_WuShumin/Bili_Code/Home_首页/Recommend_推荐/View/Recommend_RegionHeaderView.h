//
//  Recommend_RegionHeaderView.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/9/10.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "BaseCollectionReusableView.h"
#import "Data.h"

@interface Recommend_RegionHeaderView : BaseCollectionReusableView

@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *moreLabel;

@property (nonatomic, strong) Data *data;
@end
