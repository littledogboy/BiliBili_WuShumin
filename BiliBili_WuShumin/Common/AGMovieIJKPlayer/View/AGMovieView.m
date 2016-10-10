//
//  AGMovieView.m
//  AGMovieIJKPlayer
//
//  Created by 吴书敏 on 16/9/19.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "AGMovieView.h"
#import "Masonry.h"
#import "NSString+AGMovieTime.h"
#define RGBColor(r, g, b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0]

@interface AGMovieView ()
{
    BOOL _isSliding; // 滑动条是否正在滑动
    BOOL _isPlaying; // 是否正在播放
    BOOL _isUserStop; // 是否暂停
    NSTimer *_kvoTimer; //
}

@property (nonatomic, strong) UIView *ijkPlayerView;

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIView *playView;
@property (strong, nonatomic) IBOutlet UIView *topView;
@property (strong, nonatomic) IBOutlet UIView *downView;
@property (strong, nonatomic) IBOutlet UIView *inspectorView;
@property (strong, nonatomic) IBOutlet UILabel *inspectorLabel;

@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) IBOutlet UIButton *rotationButton;
@property (strong, nonatomic) IBOutlet UIButton *playerButton;
@property (strong, nonatomic) IBOutlet UIButton *playerFullScreenButton;

@property (strong, nonatomic) IBOutlet UILabel *beginLabel;
@property (strong, nonatomic) IBOutlet UILabel *endLabel;
@property (strong, nonatomic) IBOutlet UISlider *playProgress;
@property (strong, nonatomic) IBOutlet UIProgressView *loadedProgress;

// playLoadingView
@property (strong, nonatomic) IBOutlet UIView *playLoadingView;
@property (strong, nonatomic) IBOutlet UIImageView *loadingImageView;

// 约束
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topViewTop;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *downViewBottom;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *inspectorViewHeight;

@end

@implementation AGMovieView

- (void)dealloc {
    _kvoTimer = nil;
}


// nib 加载完成后调用
- (void)awakeFromNib {
    [super awakeFromNib];
    //
//    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    // slider
    self.playProgress.value = 0.0;
    [self.playProgress setThumbImage:[UIImage imageNamed:@"icmpv_thumb_light"] forState:(UIControlStateNormal)];
    // progress
    self.loadedProgress.progress = 0.0;
    // inspectorBackgroundColor
    self.inspectorView.backgroundColor = [RGBColor(203, 201, 204) colorWithAlphaComponent:0.5];
    // loadingView
    self.playLoadingView.backgroundColor = [RGBColor(203, 201, 204) colorWithAlphaComponent:0.5];
    [self playLoadViewHide];
}

// loadNib 时调用
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self == nil) return nil;
    // 利用xib自定义视图时，self 必须添加 contentView
    self.contentView = [[[NSBundle mainBundle] loadNibNamed:@"AGMovieView" owner:self options:nil] lastObject];
    [self addSubview:_contentView];
    [self setPortarintLayout];
    return self;
}

#pragma mark- Interaction Animation
- (void)setPortarintLayout {
    // hideInspector
    [self.playView sendSubviewToBack:_inspectorView];
    self.inspectorViewHeight.constant = 0.0f;
    [self layoutIfNeeded];
}

- (void)toolBarShow {
    // 约束动画
    self.topViewTop.constant = 0;
    self.downViewBottom.constant = 0;
    [UIView animateWithDuration:0.2 animations:^{
        [self layoutIfNeeded];
        self.topView.alpha = self.downView.alpha = 1;
        self.playerButton.alpha = self.playerFullScreenButton.alpha = 1;
    } completion:^(BOOL finished) {
        [self performSelector:@selector(toolBarHide) withObject:nil afterDelay:1]; // 2秒后隐藏
    }];
    
    // 显示状态条
    [[UIApplication sharedApplication] setStatusBarHidden:NO animated:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:(UIStatusBarStyleLightContent)];
}

- (void)toolBarHide {
    // 约束动画
    self.topViewTop.constant = -(self.topView.frame.size.height);
    self.downViewBottom.constant = -(self.downView.frame.size.height);
    [UIView animateWithDuration:0.2 animations:^{
        [self layoutIfNeeded];
        self.topView.alpha = self.downView.alpha = 0;
        self.playerButton.alpha = self.playerFullScreenButton.alpha = 0;
    } completion:^(BOOL finished) {
    }];
    
    // 隐藏状态条
    [[UIApplication sharedApplication] setStatusBarHidden:YES animated:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:(UIStatusBarStyleLightContent)];
}

- (void)inspectorViewShow {
    //
    [self.inspectorView.layer removeAllAnimations];
    // 更改文字
    if (_isPlaying) {
        self.inspectorLabel.text = @"继续播放";
    } else {
        self.inspectorLabel.text = @"暂停播放";
    }
    // 约束动画
    self.inspectorViewHeight.constant = 20.0f;
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self performSelector:@selector(inspectorViewHide) withObject:nil afterDelay:1]; // 0.2秒后隐藏
    }];
}

- (void)inspectorViewHide {
    self.inspectorViewHeight.constant = 0.0f;
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

// playLoadView
- (void)playLoadViewShow {
    self.playLoadingView.hidden = NO;
    CABasicAnimation *loadAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [loadAnimation setToValue:[NSNumber numberWithFloat:M_PI * 2]];
    loadAnimation.duration = 2;
    loadAnimation.repeatCount = CGFLOAT_MAX; // 循环转动
    [self.loadingImageView.layer addAnimation:loadAnimation forKey:@"loadAnimation"];
    
    NSLog(@"%.2f", self.ijkPlayer.currentPlaybackTime);
}

- (void)playLoadViewHide {
    [self.loadingImageView.layer removeAllAnimations];
    self.playLoadingView.hidden = YES;
}

// 给contentView设置约束
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    // 注意这里不能 写成 make.edges.mas_equalTo(self)
    // self 这里为 any any 状态下的宽度 600 ，正确写法用 [UIScreen mainScreen]
    CGRect bounds = [UIScreen mainScreen].bounds;
    [_contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(@(0));
        make.size.mas_equalTo(bounds.size);
    }];
    // 横竖屏判断
    if (self.traitCollection.verticalSizeClass != UIUserInterfaceSizeClassCompact) { // 竖屏
        self.downView.backgroundColor = self.topView.backgroundColor = [UIColor clearColor];
        [self.rotationButton setImage:[UIImage imageNamed:@"player_fullScreen_iphone"] forState:(UIControlStateNormal)];
    } else { // 横屏
        self.downView.backgroundColor = self.topView.backgroundColor = RGBColor(89, 87, 90);
        [self.rotationButton setImage:[UIImage imageNamed:@"player_window_iphone"] forState:(UIControlStateNormal)];
        
    }
}

#pragma mark- load ijkPlayer

- (void)setMovieURLArray:(NSArray *)movieURLArray {
    if (_movieURLArray != movieURLArray) {
        _movieURLArray = [movieURLArray copy];
        
        // init ijkPlayer
        NSURL *flvURL = _movieURLArray[0];
        self.ijkPlayer = [[IJKFFMoviePlayerController alloc] initWithContentURL:flvURL withOptions:[IJKFFOptions optionsByDefault]];
        _ijkPlayer.scalingMode = IJKMPMovieScalingModeAspectFill;
        _ijkPlayer.shouldAutoplay = YES;
        [self.ijkPlayer prepareToPlay]; // prepareToPlay
        self.ijkPlayerView = self.ijkPlayer.view;
        [self.playView insertSubview:_ijkPlayerView atIndex:0];
        [_ijkPlayerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_playView);
        }];
        
        // 调试信息
        [IJKFFMoviePlayerController setLogReport:YES];
        [IJKFFMoviePlayerController setLogLevel:k_IJK_LOG_SILENT];
        
        // 通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ijkPlayBackStateIsPreparedToPlay:) name:IJKMediaPlaybackIsPreparedToPlayDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ijkPlayBackStateDidFinish:) name:IJKMoviePlayerPlaybackDidFinishNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ijkPlayerLoadStateDidChange:) name:IJKMoviePlayerLoadStateDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ijkPlayBackStateDidChang:) name:IJKMoviePlayerPlaybackStateDidChangeNotification object:nil];
    }
}

#pragma mark- Notification

// 准备播放
- (void)ijkPlayBackStateIsPreparedToPlay:(NSNotification *)notification {
    if (_ijkPlayer.playbackState != IJKMPMoviePlaybackStatePlaying) {
        [self play];
    }
    // 添加计时器
    [self addTimer];
    self.playProgress.maximumValue = _ijkPlayer.duration;
    self.endLabel.text = [NSString convertTime:_ijkPlayer.duration];
}

// 播放完毕
- (void)ijkPlayBackStateDidFinish:(NSNotification *)notification {
    [self pause];
    [self stopTimer];
    [self refreshProgress];
}

// 加载状态改变
- (void)ijkPlayerLoadStateDidChange:(NSNotification *)notification {
    NSLog(@"loadStateDidChange %ld", self.ijkPlayer.loadState);
    if (self.ijkPlayer.loadState == IJKMPMovieLoadStateStalled) { // 停止时
        [self playLoadViewShow];
    } else { // 播放时 未知时
        [self playLoadViewHide];
    }
}

// 播放状态改变
- (void)ijkPlayBackStateDidChang:(NSNotification *)notification {
    NSLog(@"%ld", (long)self.ijkPlayer.playbackState);
}


#pragma mark- Timer
- (void)addTimer {
    _kvoTimer = [NSTimer timerWithTimeInterval:1/30.0 target:self selector:@selector(refreshProgress) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_kvoTimer forMode:NSDefaultRunLoopMode];
}

- (void)stopTimer {
    [_kvoTimer setFireDate:[NSDate distantFuture]];
}

- (void)resumeTimer {
    [_kvoTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:0]];
}

- (void)refreshProgress {
    // 播放进度
    self.beginLabel.text = [NSString convertTime:_ijkPlayer.currentPlaybackTime];
    self.playProgress.value = _ijkPlayer.currentPlaybackTime;
    // 缓冲进度
    CGFloat loadPercent = _ijkPlayer.playableDuration / _ijkPlayer.duration;
    if (loadPercent >= 0.8) {
        loadPercent = 1.0;
    }
    [self.loadedProgress setProgress:loadPercent animated:YES];
}

#pragma mark- Play And Pause
- (IBAction)playOrStopAction:(id)sender {
    if (self.ijkPlayer.isPlaying) {
        [self pause];
        _isUserStop = YES;
    } else {
        [self play];
        _isUserStop = NO;
    }
}

- (void)play {
    _isPlaying = YES;
    [_ijkPlayer play]; // 调用avplayer 的play方法
    if (_kvoTimer != nil) {
        [self resumeTimer];
    }
    [self.playButton setImage:[UIImage imageNamed:@"Stop"] forState:(UIControlStateNormal)];
    [self.playerButton setImage:[UIImage imageNamed:@"player_pause_iphone_window"] forState:(UIControlStateNormal)];
    [self.playerFullScreenButton setImage:[UIImage imageNamed:@"player_pause_iphone_fullscreen"] forState:(UIControlStateNormal)];
}

- (void)pause {
    _isPlaying = NO;
    [_ijkPlayer pause];
    [self stopTimer];
    [self.playButton setImage:[UIImage imageNamed:@"Play"] forState:(UIControlStateNormal)];
    [self.playerButton setImage:[UIImage imageNamed:@"player_start_iphone_window"] forState:(UIControlStateNormal)];
    [self.playerFullScreenButton setImage:[UIImage imageNamed:@"player_start_iphone_fullscreen"] forState:(UIControlStateNormal)];
}

#pragma mark- Slider
- (IBAction)sliderTouchDown:(id)sender {
    [self pause];
    [self stopTimer];
}

- (IBAction)sliderValueChanged:(id)sender {
    [self pause];
    [self stopTimer];
    CGFloat value = self.playProgress.value;
    self.beginLabel.text = [NSString convertTime:value];
}

- (IBAction)sliderTouchUpInside:(id)sender {
    // seekToTime
    _ijkPlayer.currentPlaybackTime = self.playProgress.value;
    BOOL isPauseOrStop = _ijkPlayer.playbackState == IJKMPMoviePlaybackStatePaused || _ijkPlayer.playbackState == IJKMPMoviePlaybackStateStopped;
    BOOL isForwardOrBackward = _ijkPlayer.playbackState == IJKMPMoviePlaybackStateSeekingForward || _ijkPlayer.playbackState == IJKMPMoviePlaybackStateSeekingBackward;
    if (isPauseOrStop && !isForwardOrBackward && !_isUserStop) {
        [self play];
        [self resumeTimer];
    }
}


#pragma mark- playBackProgress

#pragma mark- loadedProgress







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
