//
//  HotPromoteDetailViewController.h
//  热门推荐详情页面
//
//  Created by 吴书敏 on 16/6/5.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HotPromoteNavigationView;
@class Movie;

@interface HotPromoteDetailViewController : UIViewController

// navigationView
@property (nonatomic, strong) HotPromoteNavigationView *navigationView;

// blueImageView
@property (nonatomic, strong) UIImageView *blurImageView;

// playButton
@property (nonatomic, strong) UIButton *playButton;

// leftView
@property (nonatomic, strong) UIScrollView *leftView;

// rightView
@property (nonatomic, strong) UIScrollView *rightView;

// movie
@property (nonatomic, strong) Movie *movie;

@end


