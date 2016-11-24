//
//  LiveViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/27.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "LiveViewController.h"
#import "LiveRootClass.h"
#import "LiveRecommendRootClass.h"
#import "AGHTTPURLHandle.h"
#import "LiveCollectionView.h"
#import "AGRefreshViewTwo.h"
#import "AGRefreshCollectionView.h"

#import "LivePlayViewController.h" // 播放直播

@interface LiveViewController ()

@property (nonatomic, strong) LiveRootClass *liveRootClass;

@property (nonatomic, strong) LiveRecommendRootClass *liveRecommendRootClass;

@property (nonatomic, strong) NSArray *bannerArray;

@property (nonatomic, strong) NSArray *partitionArray;

@property (nonatomic, strong) LiveCollectionView *liveView;

@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = SAKURACOLOR;
    [self getData];
    [self addCollectionView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getData {
    [AGHTTPURLHandle GET:Home_LiveURLString success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:(NSJSONReadingMutableContainers) error:nil];
        self.liveRootClass = [[LiveRootClass alloc] initWithDictionary:rootDic];
        self.bannerArray = self.liveRootClass.data.banner;
        self.partitionArray = self.liveRootClass.data.partitions;
        
        [AGHTTPURLHandle GET:Live_RecommendURLString success:^(NSURLSessionDataTask *task, id responseObject) {
            NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:(NSJSONReadingMutableContainers) error:nil];
            self.liveRecommendRootClass = [[LiveRecommendRootClass alloc] initWithDictionary:rootDic];
            self.liveView.bannerArray = self.bannerArray;
            self.liveView.partionArray = self.partitionArray;
            self.liveView.liveRecommendData = self.liveRecommendRootClass.data;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.liveView reloadData];
                [self.liveView.refreshView endRefresh];
            });
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"%@", error);
        }];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (void)addCollectionView {
    self.liveView = [[LiveCollectionView alloc] initWithFrame:kHomeContentViewFrame];
    [self.view addSubview:self.liveView];
    
    WS(ws);
    [self.liveView addRefreshViewWithFrame:self.liveView.frame refreshingBlock:^{
        [ws getData];
    }];
    
    // 点击事件
    [self.liveView setHandleDidSelectedItem:^(Live *live) {
        [ws handleDidSelectedItem:live];
    }];
}

- (void)handleDidSelectedItem:(Live *)live {
    LivePlayViewController *livePlayVC = [[LivePlayViewController alloc] init];
    livePlayVC.liveURLString = live.playurl;
    [self.navigationController pushViewController:livePlayVC animated:YES];
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
