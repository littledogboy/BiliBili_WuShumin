//
//  Recommend_LiveHeaderView.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/9/10.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "Recommend_LiveHeaderView.h"

@interface Recommend_LiveHeaderView ()

@property (strong, nonatomic) IBOutlet UIView *mainView;

@end

@implementation Recommend_LiveHeaderView

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

+ (CGFloat)heightForCollectionReusableView {
    return 20;
}

@end
