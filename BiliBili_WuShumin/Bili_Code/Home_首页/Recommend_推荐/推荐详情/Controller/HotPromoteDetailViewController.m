//
//  HotPromoteDetailViewController.m
//  热门推荐详情页面
//
//  Created by 吴书敏 on 16/6/5.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "HotPromoteDetailViewController.h"
#import "HotPromoteNavigationView.h"
#import "AFNetworking.h"
#import "Movie.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
#import "UIImage+ImageEffects.h" // 苹果的高斯模糊分类
#import "HotPromoteScrollView.h"
#import "ViewController.h"

#import "LeftTableViewController.h"

#define kAVURL  @"http://app.bilibili.com/x/view?access_key=e276ecb0d41bb704b77b863edf6c0fd2&actionKey=appkey&aid=4861593&appkey=27eb53fc9058f8c3&build=3350&device=phone&plat=0&platform=ios&sign=05bea1b4452b729223ff6f37e7d85859&ts=1465117662"

@interface HotPromoteDetailViewController () <HotPromoteScrollViewDelegate>

// scrollFrame
@property (nonatomic, strong) HotPromoteScrollView *scrollView;

//
@property (nonatomic, assign) CGPoint startCenter;
@property (nonatomic, assign) CGPoint endCenter;

// playerController
@property (nonatomic, strong) ViewController *agPlayViewController;


@end

@implementation HotPromoteDetailViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"KScroll" object:nil];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 注册为通知观察者
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollAnimation:) name:@"KScroll" object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // navigation
    self.navigationController.navigationBar.hidden = YES;
    self.navigationView = [[HotPromoteNavigationView alloc] initWithFrame:CGRectMake(0, 0, 375, 64)];
    [self.view addSubview:self.navigationView];
    
    // leftButton
    UIButton *leftButton  = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"导航返回按钮"] forState:(UIControlStateNormal)];
    leftButton.alpha = 0.3;
    [leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    self.navigationView.leftButton = leftButton;
    
    // title
    self.navigationView.titleLabel.text = @"AV4830130";
    
    // blueImageView
    self.blurImageView = [[UIImageView alloc] init];
    [self.blurImageView sd_setImageWithURL:[NSURL URLWithString:self.movie.pic] placeholderImage:nil];
    [self.view addSubview:_blurImageView];
    [self.view sendSubviewToBack:_blurImageView];
    [_blurImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.and.width.equalTo(self.view);
        make.height.equalTo(self.blurImageView.mas_width).multipliedBy(210.0f/375.0f);
    }];
    
    // playButton
    self.playButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.playButton.alpha = 0.8;
    [self.playButton setImage:[UIImage imageNamed:@"播放按钮"] forState:(UIControlStateNormal)];
    [self.playButton setImage:[UIImage imageNamed:@"播放按钮"] forState:(UIControlStateHighlighted)];
    [self.playButton addTarget:self action:@selector(playAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:_playButton];
    [_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.lessThanOrEqualTo(self.blurImageView.mas_bottom).offset(-20); // option
        make.right.lessThanOrEqualTo(self.blurImageView.mas_right).offset(-24); // option
        make.width.lessThanOrEqualTo(@(50)); // option
        make.height.lessThanOrEqualTo(@(44)); // option
    }];
    
    
    //
    self.scrollView = [[HotPromoteScrollView alloc] init];
    self.scrollView.delegate = self;
    self.scrollView.leftButtonTitle = @"简介";
    self.scrollView.rightButtonTitle = @"评论";
    self.scrollView.numberLabelText = @"1111158";
    //
    LeftTableViewController *leftVC = [[LeftTableViewController alloc] init];
    self.leftView = leftVC.tableView;
    self.scrollView.leftView = self.leftView;
    [self addChildViewController:leftVC];
    UIView *rightView = [[UIView alloc] init];
    self.scrollView.leftView = self.leftView;
//    self.scrollView.rightView = rightView;
    [self.view addSubview:_scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.blurImageView.mas_bottom);
        make.left.width.height.equalTo(self.view);
    }];
    
    
}

- (void)setAid:(NSString *)aid {
    if (aid != nil) {
        _aid = aid;
        // setData
        [self request];
    }
    
}

#pragma mark- playAction

- (void)playAction:(UIButton *)button {
    // 1. 取消scrollView的代理， 代理为空时滚动不再发布通知
    self.scrollView.delegate = nil;
    // 2. 各控件复位， 发布一通知偏移量为 0
     [[NSNotificationCenter defaultCenter] postNotificationName:@"KScroll" object:nil userInfo:@{ @"contentOffsetY" : @(0.0)}];
    // 3. 添加播放控制器 AGPlayer
    self.agPlayViewController = [[UIStoryboard storyboardWithName:@"AGPlayerViewController" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"AGPlayerViewController"];
    [self.view addSubview:_agPlayViewController.view];
    [self addChildViewController:_agPlayViewController];
}


#pragma mark-
#pragma mark HotPromoteScrollViewDelegate

- (void)scrollViewDidScrollConentOffset:(CGFloat)contentOffset
{
    CGFloat blurImageHeight = _blurImageView.frame.size.height;
    
    // contentOffset 范围， 64 为自定义导航栏高度
    if (contentOffset > 0.0 && contentOffset < blurImageHeight - 64.0) {
        
        [_blurImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@(-contentOffset)); // 高斯模糊.top 与 偏移量为负数关系
        }];
        // 高斯模糊 radius 与 offset 是一个线性方程。
        // y = kx + c
        // 由： x = 0，时radius 为 4.0 得出 c 为4.0
        // 由： x = blurImageHeight - 64 时，radius 为 10.0 得出 k 为
        //     (10.0 - 4.0 ) / (blurImageHeight - 64)
        // 因此 radius =  x * (10.0 - 4.0) / (blurImageHeight - 64) + 4.0
        CGFloat start = 4.0;
        CGFloat end = 20.0;
        CGFloat radius = contentOffset * (end  - start) / (blurImageHeight - 64) + start;
        [self blurImageUseImageEffects:[UIImage imageWithContentsOfFile:[self filePathInSDWebImageForURLString:self.movie.pic]] withRadius:radius];
        return;
    } else if (contentOffset <= 0.0) {
        [_blurImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@(0));
        }];
        return;
    } else if (contentOffset >= blurImageHeight - 64.0) {
        [_blurImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@(-(blurImageHeight - 64.0)));
        }];
        return;
    }
    
}


#pragma mark-
#pragma mark 通知触发方法

- (void)scrollAnimation:(NSNotification *)notification
{
#warning "滑动太快的时候 contentOffset 不连续"

    CGFloat offstar = 0.0;
    CGFloat offend  = 210 - 64.0;
    
    // 1. get the offSet
    NSNumber *contentOffsetY = [[notification userInfo] valueForKey:@"contentOffsetY"];
    CGFloat offsetY = [contentOffsetY floatValue];
    
    // 2. get the equation about size
    // playButton : width 50 height 44 right 24 bottom 20
    // scale = (6.0/11.0 - 1) / offend * offsetY + 1.0
    CGFloat scale = (6.0f / 11.0f - 1.0f) / offend * offsetY + 1.0;
    
    CGFloat startX = _blurImageView.frame.size.width - 24 - 50.0;
    CGFloat endX   = _blurImageView.frame.size.width / 2.0 - 70 * 6.0 / 11.0;
    CGFloat startY = 20.0;
    CGFloat endY   = 11.0;
    //
    CGFloat timeX = (endX - startX) / offend * offsetY + startX;
    CGFloat timeY = (endY - startY) / offend * offsetY + startY;
    if ( offsetY >= offstar && offsetY <= offend) {
        [_playButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.blurImageView.mas_left).offset(timeX);
            make.bottom.equalTo(self.blurImageView.mas_bottom).offset(-timeY);
            make.width.equalTo(@(50 * scale)); // require
            make.height.equalTo(@(44 * scale)); // require
        }];
        return;
    } else if (offsetY < offstar) { // button 初始位置
        [_playButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.lessThanOrEqualTo(self.blurImageView.mas_bottom).offset(-20); // option
            make.right.lessThanOrEqualTo(self.blurImageView.mas_right).offset(-24); // option
            make.width.lessThanOrEqualTo(@(50)); // option
            make.height.lessThanOrEqualTo(@(44)); // option

        }];
        return;
    } else if (offsetY > offend) {
        scale = (6.0f / 11.0f - 1.0f) + 1.0;
        [_playButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.blurImageView.mas_left).offset(endX);
            make.bottom.equalTo(self.blurImageView.mas_bottom).offset(-endY);
            make.width.equalTo(@(50 * scale)); // require
            make.height.equalTo(@(44 * scale)); // require
        }];
        return;
    }
    
}


#pragma mark-
#pragma mark request

- (void)reloadData
{
    [self.blurImageView sd_setImageWithURL:[NSURL URLWithString:self.movie.pic] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [self blurImageUseImageEffects:image withRadius:4.0];
    }];
}

- (void)request
{
#pragma mark-  v2 请求要签名
//    NSString *urlString = [NSString stringWithFormat:@"http://app.bilibili.com/x/v2/view?access_key=ccb14baf8320c1c2635011cceffa2b0c&actionKey=appkey&aid=%@&appkey=27eb53fc9058f8c3&build=3710&device=phone&from=1&mobi_app=iphone&platform=ios&sign=3875c4675552ddbe1f7b93c3e076eef9&ts=1473586164", @"6207375"];
    NSLog(@"%@", self.aid);
    NSString *urlString = [NSString stringWithFormat:@"http://app.bilibili.com/x/view?actionKey=appkey&aid=%@&appkey=27eb53fc9058f8c3&build=3380", self.aid];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:(NSJSONReadingMutableContainers) error:nil];
        NSDictionary *data = [rootDic valueForKeyPath:@"data"];
        if (!data) {
            NSLog(@"%s %d url错误", __FUNCTION__, __LINE__);
        }
        self.movie = [[Movie alloc] initWithDictionary:data];
        [self reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    
}

// leftButtonAction:
- (void)leftButtonAction:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

// status
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

// viewWillAppear
- (void)viewWillAppear:(BOOL)animated
{
    [self setNeedsStatusBarAppearanceUpdate]; // 更新
}

#pragma mark-
#pragma mark 高斯模糊
- (void)addBlurEffect
{
    // 方式1： visulEffectView 只能调整aplha 不能调整模糊程度
//    // create blurEffect
//    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:(UIBlurEffectStyleLight)];
//    // visrulEffectView
//    UIVisualEffectView *visulEffectView  = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//    // set alpha
////    visulEffectView.alpha = 0.95; // 没有用，并不能调整模糊效果
//    // frame
//    [self.view layoutIfNeeded];
//    visulEffectView.frame = self.blueImageView.bounds;
//    // add
//    [self.blueImageView addSubview:visulEffectView];
    
    // 方式2：CIImage 实现复杂比较难写

}

#pragma mark- 苹果分类高斯模糊
- (void)blurImageUseImageEffects:(UIImage *)image withRadius:(CGFloat )radius
{
    // 4.0
    UIImage *blurImage = [image applyBlurWithRadius:radius tintColor:nil saturationDeltaFactor:1.0 maskImage:nil];
    self.blurImageView.image = blurImage;
}

- (NSString *)filePathInSDWebImageForURLString:(NSString *)urlString
{
    NSString *filePath = nil;
    BOOL isExit = [[SDWebImageManager sharedManager] diskImageExistsForURL:[NSURL URLWithString:urlString]];
    if (isExit) {
        NSString *cacheKey = [[SDWebImageManager sharedManager] cacheKeyForURL:[NSURL URLWithString:urlString]];
        if (cacheKey.length) {
            filePath = [[SDImageCache sharedImageCache] defaultCachePathForKey:cacheKey];
        }
    }
    return filePath;
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
