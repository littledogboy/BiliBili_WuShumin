//
//  RegionIconView.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/11/25.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegionIconView : UIView

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *iconNameLabel;

- (instancetype)initWithFrame:(CGRect)frame iconImage:(UIImage *)iconImage iconName:(NSString *)iconName;

@end
