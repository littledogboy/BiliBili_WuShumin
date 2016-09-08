//
//  Recommend_RecommendHeaderView.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/8/25.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "Recommend_RecommendHeaderView.h"

@implementation Recommend_RecommendHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = RecommendGrayColor;
    self.downView.backgroundColor = RecommendGrayColor;
    [self.topView addSubview:self.agCSView]; // 懒加载
}

- (AGCircularScrollView *)agCSView {
    if (_agCSView == nil) {
        self.agCSView = [[AGCircularScrollView alloc] initWithFrame:_topView.bounds];
    }
    return _agCSView;
}


- (void)setBannerImageModel:(NSArray *)bannerImageModel {
    if (bannerImageModel != nil && bannerImageModel.count > 0) {
        _bannerImageModel = bannerImageModel;
        self.agCSView.bannerImageModel = bannerImageModel;
    }
}

+ (CGFloat)heightForCollectionReusableView {
    CGFloat height = screenWidth * 150 / 375.0;
    return height;
}




@end
