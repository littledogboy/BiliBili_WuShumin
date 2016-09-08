//
//  MainTabBarController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/8/23.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeNavigationController.h" 
#import "CategoryNavigationController.h"
#import "AttentionNavigationController.h"
#import "DiscoveryNavigationController.h"
#import "MineNavigationController.h"

#import "HomeViewController.h"
#import "CategoryViewController.h"
#import "AttentionViewController.h"
#import "DiscoveryViewController.h"
#import "MineViewController.h"

// home_childViewControllers
#import "RecommendViewController.h"

@interface MainTabBarController ()

@property (nonatomic, retain) HomeNavigationController *homeNC;
@property (nonatomic, retain) CategoryNavigationController *categoryNC;
@property (nonatomic, retain) AttentionNavigationController *attentionNC;
@property (nonatomic, retain) DiscoveryNavigationController *discoveryNC;
@property (nonatomic, retain) MineNavigationController *mineNC;

@property (nonatomic, retain) HomeViewController *homeVC;
@property (nonatomic, retain) CategoryViewController *categoryVC;
@property (nonatomic, retain) AttentionViewController *attentionVC;
@property (nonatomic, retain) DiscoveryViewController *discoveryVC;
@property (nonatomic, retain) MineViewController *mineVC;

@end

@implementation MainTabBarController

// 重写 init
- (instancetype)init {
    self = [super init];
    if (self) {
        //
        UIViewController *VC1 = [[UIViewController alloc] init];
        VC1.view.backgroundColor = [UIColor redColor];
        RecommendViewController *recommendVC = [[RecommendViewController alloc] init];
        recommendVC.view.backgroundColor = [UIColor yellowColor];
        UIViewController *VC3 = [[UIViewController alloc] init];
        VC3.view.backgroundColor = [UIColor blueColor];
        self.homeVC = [[HomeViewController alloc] init];
        _homeVC.viewControllers = @[VC1, recommendVC, VC3];
        self.homeNC = [[HomeNavigationController alloc] initWithRootViewController:_homeVC];
        
        self.categoryVC = [[CategoryViewController alloc] init];
        self.categoryNC = [[CategoryNavigationController alloc] initWithRootViewController:_categoryVC];
        
        self.attentionVC = [[AttentionViewController alloc] init];
        self.attentionNC = [[AttentionNavigationController alloc] initWithRootViewController:_attentionVC];
        
        self.discoveryVC = [[DiscoveryViewController alloc] init];
        self.discoveryNC = [[DiscoveryNavigationController alloc] initWithRootViewController:_discoveryVC];
        
        self.mineVC = [[MineViewController alloc] init];
        self.mineNC = [[MineNavigationController alloc] initWithRootViewController:_mineVC];
        
        // set viewControllers
        [self setViewControllers:@[_homeNC, _categoryNC, _attentionNC, _discoveryNC, _mineNC]];
        
        // setTabBarItem
        [_homeNC setTabBarItem:[[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"home_home_tab"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] selectedImage:[[UIImage imageNamed:@"home_home_tab_s"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)]]];
        [_categoryNC setTabBarItem:[[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"home_category_tab"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] selectedImage:[[UIImage imageNamed:@"home_category_tab_s"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)]]];
        [_attentionNC setTabBarItem:[[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"home_attention_tab"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] selectedImage:[[UIImage imageNamed:@"home_attention_tab_s"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)]]];
        [_discoveryNC setTabBarItem:[[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"home_discovery_tab"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] selectedImage:[[UIImage imageNamed:@"home_discovery_tab_s"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)]]];
        [_mineNC setTabBarItem:[[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"home_mine_tab"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] selectedImage:[[UIImage imageNamed:@"home_mine_tab_s"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)]]];
        
        // setEdgeInsets
        UIEdgeInsets insets = UIEdgeInsetsMake(6, 0, -6, 0);
        if (IOS_7) {
            _homeNC.tabBarItem.imageInsets = insets;
            _categoryNC.tabBarItem.imageInsets = insets;
            _attentionNC.tabBarItem.imageInsets = insets;
            _discoveryNC.tabBarItem.imageInsets = insets;
            _mineNC.tabBarItem.imageInsets = insets;
        }
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
