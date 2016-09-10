//
//  Recommend_RegionHeaderView.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/9/10.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "Recommend_RegionHeaderView.h"

@implementation Recommend_RegionHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    self.mainView.backgroundColor = RecommendGrayColor;
}

- (void)setData:(Data *)data {
    if (data != nil) {
        _data = data;
        self.iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"home_region_icon_%@", data.param]];
        self.titleLabel.text = data.title;
        NSString *subStirng = [data.title substringToIndex:2];
        if ([data.title isEqualToString:@"电视剧区"]) {
            subStirng = @"电视剧";
        }
        self.moreLabel.text = [NSString stringWithFormat:@"更多%@", subStirng];
    }
}

+ (CGFloat)heightForCollectionReusableView {
    return 20;
}




@end
