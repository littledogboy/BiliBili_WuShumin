//
//  DiscoveryViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/8/23.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "DiscoveryViewController.h"
#import "SearchBarViewController.h"
#import "HotWordViewController.h"
#import "BBSViewController.h"

#define KSearchBarHeight 63 // 搜索条高度

@interface DiscoveryViewController ()

@property (nonatomic, strong) SearchBarViewController *searchBarVC;
@property (nonatomic, strong) HotWordViewController *hotwordVC;
@property (nonatomic, strong) BBSViewController *bbsVC;

@end

@implementation DiscoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self loadSubVC];
}

- (void)loadSubVC {
    // sarchVC
    self.searchBarVC = [[SearchBarViewController alloc] init];
    _searchBarVC.keyWord = nil;
    [self.view addSubview:_searchBarVC.view];
    [self addChildViewController:_searchBarVC];
    
    // hotwordVC
    self.hotwordVC = [[HotWordViewController alloc] init];
    _hotwordVC.view.backgroundColor = SAKURACOLOR;
    [self.view insertSubview:_hotwordVC.view belowSubview:_searchBarVC.view];
    [self addChildViewController:_hotwordVC];
    // hotwordVc.block
    WS(ws);
    _hotwordVC.didSelectedCellBlock = ^(NSString *titleString) {
        ws.searchBarVC.keyWord = titleString;
    };
    
    [_hotwordVC.view makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(KSearchBarHeight));
        make.left.right.equalTo(self.view);
        make.height.equalTo(@173);
    }];
    
    // bbsVC
    self.bbsVC = [[BBSViewController alloc] init];
    [self.view insertSubview:_bbsVC.view belowSubview:_hotwordVC.view];
    [_bbsVC.view makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hotwordVC.view.bottom);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.bottom).offset(@(-40));
    }];
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
