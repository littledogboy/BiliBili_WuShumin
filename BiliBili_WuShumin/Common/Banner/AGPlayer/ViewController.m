//
//  ViewController.m
//  AGPlayer
//
//  Created by 吴书敏 on 16/7/14.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "ViewController.h"
#import "AGPlayerView.h"
#import "H5_AVInfo.h"

#define MovieURL @"http://cn-zjhz4-dx.acgvideo.com/vg2/7/32/8296116-1.mp4?expires=1469523900&ssig=-gA3dQTWN1zSbibksL_n7g&oi=1700218919&internal=1&rate=0"

@interface ViewController ()

@property (nonatomic, strong) H5_AVInfo *avInfo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, screenWidth, screenWidth * 14 / 25);
    self.view.backgroundColor = [UIColor clearColor];
    // 网络请求
    [self getURLWithAID:@"1025020"];
    //
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)getURLWithAID:(NSString *)aid {
    // 1. http://www.bilibili.com/m/html5?aid=5106865&page=1
    NSString *h5String = [NSString stringWithFormat:@"http://www.bilibili.com/m/html5?aid=%@&page=1", aid];
    NSURL *url = [NSURL URLWithString:h5String];
    // 2.
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *getTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 解析数据
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        self.avInfo = [[H5_AVInfo alloc] init];
        [_avInfo setValuesForKeysWithDictionary:rootDic];
        NSURL *url = [NSURL URLWithString:_avInfo.src];
        [self.playerView updatePlayerWithURL:url]; // 播放视频
        self.playerView.viewController = self;
    }];
    // 3.
    [getTask resume];
}


#pragma mark- 解决向上传递的响应者链问题

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    if (self.traitCollection.verticalSizeClass != UIUserInterfaceSizeClassCompact) { // 竖屏
        self.view.frame = CGRectMake(0, 0, screenWidth, screenWidth * 14 / 25);
    } else { // 横屏
        self.view.frame = [UIScreen mainScreen].bounds;
    }
}





#pragma mark- status bar 设置
// iOS 9.0 之后set方法弃用，需要在 controller 中实现
// 新方法 需要将View controller-based status bar appearance设置为YES,才会有效果,
// 1. 设置样式
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent; // 白色的
}
// 2. 横屏时显示 statusBar
- (BOOL)prefersStatusBarHidden {
    return NO; // 显示
}

// 3. 设置隐藏动画
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationNone;
}


#pragma mark- 消失时停止播放
- (void)viewWillDisappear:(BOOL)animated {
    [self.playerView pause];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
