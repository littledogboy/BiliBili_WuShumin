//
//  LiveIJKPlayerView.m
//  AGLiveIJKPlayer
//
//  Created by 吴书敏 on 16/11/10.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "LiveIJKPlayerView.h"
#import <Masonry.h>

#define RGBColor(r, g, b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0]


@interface LiveIJKPlayerView ()

@property (nonatomic, weak) UIView *ijkPlayerView;

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIImageView *topViewBg;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *moreButton;

@property (nonatomic, strong) UIView *downView;
@property (nonatomic, strong) UIImageView *downViewBg;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UIButton *rotationButton;

@property (nonatomic, strong) UIButton *windowPlayButton;

// 加载页面
@property (nonatomic, strong) UIView *loadingView;
@property (nonatomic, strong) UIImageView *loadingAnimationView;

@end

@implementation LiveIJKPlayerView

- (void)dealloc {
    [self.ijkPlayer shutdown];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    // 添加内部控件，设置约束
    // topView
    self.topView = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:_topView];
    __weak typeof(self) ws = self;
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(ws);
        make.height.mas_equalTo(@(60));
    }];
    
    // topViewBg
    self.topViewBg = [[UIImageView alloc] initWithFrame:CGRectZero];
    _topViewBg.image = [UIImage imageNamed:@"palyer_top_bg"];
    [self.topView addSubview:_topViewBg];
    [_topViewBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.topView);
    }];
    
    // backViewButton
    self.backButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.backButton.adjustsImageWhenHighlighted = NO;
    [self.backButton setImage:[UIImage imageNamed:@"live_back_ico"] forState:(UIControlStateNormal)];
    [_backButton addTarget:self action:@selector(popBackAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.topView addSubview:_backButton];
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.topView).mas_offset(15);
        make.bottom.mas_equalTo(ws.topView);
        make.width.height.mas_equalTo(@(30));
    }];
    
    // moreButton
    self.moreButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.moreButton.adjustsImageWhenHighlighted = NO;
    [self.moreButton setImage:[UIImage imageNamed:@"live_more_normal_portrait"] forState:UIControlStateNormal];
    [self.topView addSubview:_moreButton];
    [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws.topView).mas_equalTo(-15);
        make.bottom.mas_equalTo(ws.topView);
        make.width.height.mas_equalTo(@(30));
    }];
    
    // downView
    self.downView = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:_downView];
    [_downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(ws);
        make.height.mas_equalTo(@(60));
    }];
    
    // downViewBg
    self.downViewBg = [[UIImageView alloc] initWithFrame:CGRectZero];
    _downViewBg.image = [UIImage imageNamed:@"live_bottom_bg"];
    [self.downView addSubview:_downViewBg];
    [_downViewBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.downView);
    }];
    
    // playButton
    self.playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _playButton.adjustsImageWhenHighlighted = NO;
    [_playButton setImage:[UIImage imageNamed:@"player_pause_bottom_window"] forState:UIControlStateNormal];
    [self.downView addSubview:_playButton];
    [_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.downView).mas_offset(12);
        make.bottom.mas_equalTo(ws.downView).mas_offset(-12);
        make.width.height.mas_equalTo(@(30));
    }];
    
    // rotationButton
    self.rotationButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    _rotationButton.adjustsImageWhenHighlighted = NO;
    [_rotationButton setImage:[UIImage imageNamed:@"liveplayer_fullScreen_iphone"] forState:UIControlStateNormal];
    [self.downView addSubview:_rotationButton];
    [_rotationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws.downView).mas_offset(-30);
        make.bottom.mas_equalTo(ws.downView).mas_offset(-12);
        make.width.height.mas_offset(@(30));
    }];
    
    [_rotationButton addTarget:self action:@selector(rotationAction) forControlEvents:UIControlEventTouchUpInside];
    
    // windowPlayButton
    self.windowPlayButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_windowPlayButton setBackgroundImage:[UIImage imageNamed:@"player_pause_iphone_window"] forState:(UIControlStateNormal)];
    _windowPlayButton.adjustsImageWhenHighlighted = NO;
    [_windowPlayButton addTarget:self action:@selector(playOrPauseAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:_windowPlayButton];
    [_windowPlayButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).offset(-12);
        make.bottom.equalTo(ws.downView.top).offset(0);
        make.width.equalTo(@(53));
        make.height.equalTo(@(51));
    }];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame liveURLString:(NSString *)urlString {
    self = [self initWithFrame:frame];
    if (self) {
        self.liveURLString = urlString;
        // 创建ijkPlayercontroller
        self.ijkPlayer = [[IJKFFMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:urlString] withOptions:[IJKFFOptions optionsByDefault]];
        _ijkPlayer.scalingMode = IJKMPMovieScalingModeAspectFill;
        _ijkPlayer.shouldAutoplay = YES;
        [_ijkPlayer prepareToPlay];
        [_ijkPlayer play];
        
        // ijkPlayerview
        self.ijkPlayerView = self.ijkPlayer.view;
        [self insertSubview:_ijkPlayerView belowSubview:_topView];
        [_ijkPlayerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        
        // 调试信息
        [IJKFFMoviePlayerController setLogReport:YES];
        [IJKFFMoviePlayerController setLogLevel:k_IJK_LOG_SILENT];
        
        // 通知
        // 准备播放
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iJKMoviePlayerPlaybackIsPreparedToPlay:) name:IJKMediaPlaybackIsPreparedToPlayDidChangeNotification object:nil];
        // 加载状态改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iJKMoviePlayerLoadStateDidChange:) name:IJKMoviePlayerLoadStateDidChangeNotification object:nil];
        
        // 添加加载页面
        [self addLoadingView];
    }
    return self;
}


#pragma mark- 加载页面
- (void)addLoadingView {
    
    __weak typeof(self)ws = self;
    
    self.loadingView = [[UIView alloc] initWithFrame:CGRectZero];
    self.loadingView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_loadingView];
    [_loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    // loadingAnimationView
    self.loadingAnimationView = [[UIImageView alloc] initWithFrame:CGRectZero];
    NSMutableArray *imagesArray = [NSMutableArray array];
    for (int i = 1; i < 6; i++) {
        NSString *imageString = [NSString stringWithFormat:@"ani_loading_%d", i];
        UIImage *image = [UIImage imageNamed:imageString];
        [imagesArray addObject:image];
    }
    _loadingAnimationView.contentMode = UIViewContentModeCenter;
    _loadingAnimationView.animationImages = imagesArray;
    _loadingAnimationView.animationDuration = 0.4;
    _loadingAnimationView.animationRepeatCount = 0;
    [_loadingAnimationView startAnimating];
    [self.loadingView addSubview:_loadingAnimationView];
    [_loadingAnimationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.loadingView);
    }];
}


- (void)rotationAction {
    [self.delegate liveViewRatation];
}

#pragma mark- 通知方法

- (void)iJKMoviePlayerPlaybackIsPreparedToPlay:(NSNotification *)noti {
    if (_ijkPlayer.playbackState != IJKMPMoviePlaybackStatePlaying) {
        [self play];
    }
    // 准备播放移除加载视图
    [self.loadingAnimationView stopAnimating];
    [self.loadingView removeFromSuperview];
}

- (void)iJKMoviePlayerLoadStateDidChange:(NSNotification *)noti {
    // 加载出错
    if (_ijkPlayer.loadState == IJKMPMovieLoadStateUnknown) {
        NSLog(@"加载出错");
        [self.loadingAnimationView stopAnimating];
        [self.loadingView removeFromSuperview];
    }
}

#pragma mark- play
- (void)playOrPauseAction {
    if (self.ijkPlayer.playbackState == IJKMPMoviePlaybackStatePlaying) {
        [self pause];
    } else if (self.ijkPlayer.playbackState == IJKMPMoviePlaybackStatePaused) {
        [self play];
    }
}

- (void)play {
    [self.ijkPlayer play];
}

- (void)pause {
    [self.ijkPlayer pause];
}

- (void)shutDown {
    [self.ijkPlayer shutdown];
}

#pragma mark- back

- (void)popBackAction {
    if ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) {
        [[UIViewController currentNavigationViewController] popToRootViewControllerAnimated:YES];
    } else {
        [self rotationAction];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
