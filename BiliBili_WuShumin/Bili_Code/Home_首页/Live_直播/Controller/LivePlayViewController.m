//
//  LivePlayViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/11/15.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "LivePlayViewController.h"
#import "AGLiveIJKPlayerController.h"
#import "LivePlayView.h"

@interface LivePlayViewController ()

@property (nonatomic, strong) LivePlayView *livePlayView;
@property (nonatomic, strong) AGLiveIJKPlayerController *liveIJKPlayerController;

@end

@implementation LivePlayViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addLivePlayView];
    [self addLivePlayer];
    // Do any additional setup after loading the view.
}

- (void)addLivePlayView {
    WS(ws);
    self.livePlayView = [[LivePlayView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_livePlayView];
    [_livePlayView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view);
    }];
}

- (void)addLivePlayer {
    self.liveIJKPlayerController = [[AGLiveIJKPlayerController alloc] init];
    _liveIJKPlayerController.liveURLString = _liveURLString;
    [self.view addSubview:_liveIJKPlayerController.view];
    [self addChildViewController:_liveIJKPlayerController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark- 生命周期
- (void)viewWillAppear:(BOOL)animated {
    [UIViewController currentNavigationViewController].tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [UIViewController currentNavigationViewController].tabBarController.tabBar.hidden = NO;
}


- (BOOL)shouldAutorotate {
    return NO;
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
