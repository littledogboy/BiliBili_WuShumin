//
//  FindSearchCollectionReusableView.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 17/1/24.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindSearchCollectionReusableView : UICollectionReusableView

@property (nonatomic, strong, readonly) UIButton *titleButton;

+ (CGFloat)resuableViewHeight;

@end
