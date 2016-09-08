//
//  Recommend_RecommendHeaderView.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/8/25.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGCircularScrollView.h"
#import "BaseCollectionReusableView.h"

@interface Recommend_RecommendHeaderView : BaseCollectionReusableView

@property (strong, nonatomic) IBOutlet UIView *topView;
@property (nonatomic, strong) AGCircularScrollView *agCSView;
@property (strong, nonatomic) IBOutlet UIView *downView;
@property (strong, nonatomic) IBOutlet UIImageView *leftImageView;
@property (strong, nonatomic) IBOutlet UILabel *leftLabel;
@property (strong, nonatomic) IBOutlet UIImageView *rightImageView;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel;

// 图片网络链接数组
@property (nonatomic, copy) NSArray *bannerImageModel;

@end
