//
//  Bungumi_PreviousHeaderView.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/16.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "Bungumi_PreviousHeaderView.h"

@interface Bungumi_PreviousHeaderView ()

@property (strong, nonatomic) IBOutlet UIView *mainView;


@end


@implementation Bungumi_PreviousHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = RecommendGrayColor;
    self.mainView.backgroundColor = RecommendGrayColor;
}

+ (CGSize )sizeOfBungumi_PreviousHeaderView {
    return CGSizeMake(screenWidth, 20);
}



@end
