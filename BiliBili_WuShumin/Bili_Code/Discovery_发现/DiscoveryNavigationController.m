//
//  DiscoveryNavigationController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/8/23.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "DiscoveryNavigationController.h"

@interface DiscoveryNavigationController ()

@end

@implementation DiscoveryNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.hidden = YES;
}

// barStyle 由 topVC 决定
- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

// 自由旋转 由 topVC 决定
- (BOOL)shouldAutorotate {
    return self.topViewController.shouldAutorotate;
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
