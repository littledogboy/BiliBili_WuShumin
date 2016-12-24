//
//  FindSearchResultViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/24.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "FindSearchResultViewController.h"
#import "FindSearchResultRootViewController.h"

@interface FindSearchResultViewController ()

@property (nonatomic, strong) NSString *keyword;
@property (nonatomic, strong) FindSearchResultRootViewController *rootVC;


@end

@implementation FindSearchResultViewController

- (instancetype)initWithKeyword:(NSString *)keyword {
    self = [super init];
    if (self) {
        self.keyword = keyword;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addRootVC];
    // Do any additional setup after loading the view.
}

- (void)addRootVC {
    self.rootVC = [[FindSearchResultRootViewController alloc] init];
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = RecommendGrayColor;
    UIViewController *vc2 = [[UIViewController alloc] init];
    UIViewController *vc3 = [[UIViewController alloc] init];
    UIViewController *vc4 = [[UIViewController alloc] init];
    UIViewController *vc5 = [[UIViewController alloc] init];
    _rootVC.menuTitleArray = @[@"综合", @"番剧()", @"UP主()", @"影视()", @"专题"];
    _rootVC.viewControllers = @[vc1, vc2, vc3, vc4, vc5];
    [self.view addSubview:_rootVC.view];
    [self addChildViewController:_rootVC];
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
