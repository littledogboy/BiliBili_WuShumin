//
//  HotPromoteNavigationController.m
//  热门推荐详情页面
//
//  Created by 吴书敏 on 16/6/6.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "HotPromoteNavigationController.h"

@interface HotPromoteNavigationController ()

@end

@implementation HotPromoteNavigationController


- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
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
