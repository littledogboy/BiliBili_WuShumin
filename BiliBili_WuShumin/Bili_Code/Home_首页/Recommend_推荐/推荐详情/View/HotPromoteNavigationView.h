//
//  HotPromoteNavigationView.h
//  热门推荐详情页面
//
//  Created by 吴书敏 on 16/6/6.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotPromoteNavigationView : UIView

// statusBar
@property (nonatomic, strong) UIView *statusBar;

// nagivationBar
@property (nonatomic, strong) UIView *navigationBar;

// leftButton
@property (nonatomic, strong) UIButton *leftButton;

// rightButton
@property (nonatomic, strong) UIButton *rightButton;

// title
@property (nonatomic, strong) UILabel *titleLabel;

@end
