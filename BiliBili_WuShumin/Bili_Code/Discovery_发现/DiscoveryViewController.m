//
//  DiscoveryViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/8/23.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "DiscoveryViewController.h"
#import "SearchBarViewController.h"

@interface DiscoveryViewController ()

@property (nonatomic, strong) SearchBarViewController *searchBarVC;

@end

@implementation DiscoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadSubVC];
}

- (void)loadSubVC {
    self.searchBarVC = [[SearchBarViewController alloc] init];
    [self.view addSubview:_searchBarVC.view];
    [self addChildViewController:_searchBarVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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
