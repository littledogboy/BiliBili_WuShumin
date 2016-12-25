//
//  FindSearchResultViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/24.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "FindSearchResultViewController.h"
#import "FindSearchResultRootViewController.h"
#import "FindSearchResultModel.h"

@interface FindSearchResultViewController ()

@property (nonatomic, strong) NSString *keyword;
@property (nonatomic, strong) FindSearchResultRootViewController *rootVC;
@property (nonatomic, strong) FindSearchResultModel *resultModel;

@end

@implementation FindSearchResultViewController

- (instancetype)initWithKeyword:(NSString *)keyword {
    self = [super init];
    if (self) {
        self.keyword = keyword;
        self.resultModel = [[FindSearchResultModel alloc] init];
        _resultModel.keyWord = keyword;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addRootVC];
    // Do any additional setup after loading the view.
    // 重新给 nav title 
    [_resultModel getSearchResultEntityWithSuccess:^{
        NSArray *navArray = _resultModel.resultData.nav;
        NSInteger (^perNavTotal)(id nav) = ^NSInteger (id nav) {
            NSInteger total = ((FindNav *)(nav)).total;
            return total > 99 ? 99 : total;
            
        };
        NSArray *titleArray = @[@"综合",
                                [NSString stringWithFormat:@"番剧(%lu)", perNavTotal(navArray[0])],
                                [NSString stringWithFormat:@"UP主(%lu)", perNavTotal(navArray[1])],
                                [NSString stringWithFormat:@"影视(%lu)", perNavTotal(navArray[2])],
                                [NSString stringWithFormat:@"专题(%lu)", perNavTotal(navArray[3])],
                                ];
        dispatch_async(dispatch_get_main_queue(), ^{
            _rootVC.menuTitleArray = titleArray;
        });
    } failure:^(NSString *errorMsg) {
        NSLog(@"%@", errorMsg);
    }];
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
