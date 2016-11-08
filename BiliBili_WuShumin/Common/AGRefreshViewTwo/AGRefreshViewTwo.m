//
//  AGRefreshViewTwo.m
//  检测CollectionView的ContentView
//
//  Created by 吴书敏 on 16/11/2.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "AGRefreshViewTwo.h"
#import <objc/runtime.h>
#import <Masonry.h>
#import "UIView+CornerRadius.h"

#define RGBCOLOR(r, g, b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0f]
#define SAKURACOLOR RGBCOLOR(250, 114, 152)
#define GrayColor RGBCOLOR(244, 244, 244)
#define RefreshHight 100.0
#define OffSetHeight RefreshHight / 2.0
#define AntennaWidth 50.0
#define AntennaHeight 6.0
#define zoomFactor 1 // 缩放系数，为了使每次得到的角度更加精确

// 角度转化为弧度
#define RadianOfDegree(degree) degree * M_PI / 180


@interface AGRefreshViewTwo ()
{
    NSInteger _repeatNumber;
}

// 内部控件
@property (nonatomic, strong) UILabel *topLabel; // 上文字
@property (nonatomic, strong) UILabel *topLabel2; // 上文字2
@property (nonatomic, strong) UIView *leftAntenna; //  左天线
@property (nonatomic, strong) UIView *rightAntenna; // 右天线
@property (nonatomic, strong) UIView *downView; // 下视图
@property (nonatomic, strong) UIImageView *smallImageView; // 笑脸
@property (nonatomic, strong) UILabel *downLabel; // 下文字

// 监控的滚动视图
@property (nonatomic, strong) UIScrollView *scrollView;

// 刷新时进行的网络回调
@property (nonatomic, copy) void (^refreshBlock)();

// 是否在刷新
@property (nonatomic, assign) BOOL isRefreshing;

// 视图状态
@property (nonatomic, assign) RefreshState state;

// 动画状态
@property (nonatomic, assign) BOOL isAntennaAnimating;
@property (nonatomic, assign) BOOL isViewAnimating;

// cadisplayLink
@property (nonatomic, strong) CADisplayLink *displayLink;
// 定时器时给的旋转角度
@property (nonatomic, assign) CGFloat degree;

@end

@implementation AGRefreshViewTwo

- (instancetype)initWithFrame:(CGRect)frame block:(void (^)())block scrollView:(UIScrollView *)scrollView
{
    self = [self initWithFrame:frame];
    if (self) {
        self.refreshBlock = block;
        self.scrollView = scrollView;
        self.isRefreshing = NO; // 默认也是no
        // refreshView 观察 scrollView 的偏移量
        [self.scrollView addObserver:self forKeyPath:@"contentOffset" options:(NSKeyValueObservingOptionNew) context:nil];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    CGRect rect = CGRectMake(0, -RefreshHight, frame.size.width, RefreshHight);
    self = [super initWithFrame:rect];
    if (self) {
        self.backgroundColor = SAKURACOLOR;
        _repeatNumber = 0;
        
        // downView
        self.downView = [[UIView alloc] initWithFrame:CGRectZero];
        self.downView.backgroundColor = GrayColor;
        [self addSubview:_downView];
        __weak typeof(self) weakSelf = self;
        [_downView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_equalTo(weakSelf);
            make.height.mas_equalTo(@(RefreshHight / 2.0));
        }];
        
        // left
        self.leftAntenna = [[UIView alloc] initWithFrame:CGRectZero];
        self.leftAntenna.backgroundColor = GrayColor;
        [self insertSubview:_leftAntenna belowSubview:_downView];
        [_leftAntenna mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(weakSelf.downView);
            make.width.mas_equalTo(@(AntennaWidth));
            make.height.mas_equalTo(@(AntennaHeight));
            make.centerX.mas_equalTo(weakSelf.downView.mas_centerX).mas_offset(-12);
        }];
        
        // right
        self.rightAntenna = [[UIView alloc] initWithFrame:CGRectZero];
        self.rightAntenna.backgroundColor = GrayColor;
        [self insertSubview:_rightAntenna belowSubview:_downView];
        [_rightAntenna mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(weakSelf.downView);
            make.width.mas_equalTo(@(AntennaWidth));
            make.height.mas_equalTo(@(AntennaHeight));
            make.centerX.mas_equalTo(weakSelf.downView.mas_centerX).mas_offset(12);
        }];
        
        // topLabel
        self.topLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _topLabel.textColor = [UIColor whiteColor];
        _topLabel.font = [UIFont systemFontOfSize:14];
        [self insertSubview:_topLabel atIndex:0];
        [_topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(weakSelf);
            make.bottom.mas_equalTo(weakSelf.downView.mas_top).mas_offset(-30);
        }];
        
    }
    return self;
}

- (UILabel *)topLabel2 {
    if (_topLabel2 == nil) {
        self.topLabel2 = [[UILabel alloc] initWithFrame:CGRectZero];
        _topLabel2.textColor = [UIColor whiteColor];
        _topLabel2.font = [UIFont systemFontOfSize:14];
        [self.scrollView addSubview:_topLabel2];
        [_topLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(-100);
            make.centerX.mas_offset(0);
        }];
    }
    return _topLabel2;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!self.downView.layer.mask) {
        [self.downView rectCorner:UIRectCornerTopLeft | UIRectCornerTopRight withCornerRadius:8.0];
    }
    
    if (!self.leftAntenna.layer.mask) {
        [self.leftAntenna rectCorner:UIRectCornerTopLeft | UIRectCornerBottomLeft withCornerRadius:3.0];
    }
    
    if (!self.rightAntenna.layer.mask) {
        [self.rightAntenna rectCorner:UIRectCornerTopRight | UIRectCornerBottomRight withCornerRadius:3.0];
    }
}


#pragma mark-  KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSValue *value = (NSValue *)[change objectForKey:@"new"];
    CGPoint offset = [value CGPointValue];
    CGFloat offsetY = offset.y;
    
    if (offsetY >= -OffSetHeight) {
        self.leftAntenna.transform = CGAffineTransformMakeRotation(0);
        self.rightAntenna.transform = CGAffineTransformMakeRotation(0);
    } else if (offsetY< -OffSetHeight && offsetY > -2 * OffSetHeight) {
        [self stopAntennaAnimation];
        CGFloat radian = [self radianOfContentOffSetY:offsetY];
        self.leftAntenna.transform = CGAffineTransformMakeRotation(radian);
        self.rightAntenna.transform = CGAffineTransformMakeRotation(-radian);
        self.topLabel.alpha = [self alpahOfContentOffSetY:offsetY];
        _topLabel.text = @"再用力点!";
        _topLabel2.alpha = 0;
    } else if (offsetY <= -2 * OffSetHeight && _scrollView.isDragging) {
        // label
        self.topLabel.alpha = 0;
        self.topLabel2.alpha = 0.5;
        self.topLabel2.text = @"松手加载";
        [self.topLabel2 mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(offsetY);
        }];
        
        // 开始天线动画
        [self startAntennaAnimation];
    }
    
    // 如果松手则停止动画
    if (_scrollView.isDragging == NO && [_topLabel2.text isEqualToString:@"松手加载"] && offsetY < -50) {
        self.topLabel2.alpha = 0;
        // 停止天线动画
        [self stopAntennaAnimation];
        [self setConentOffsetAnimation:-OffSetHeight];
        // 开始加载动画
        [self startRefresh];
    }
}


#pragma mark - Refresh
- (void)startRefresh {
    self.smallImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.smallImageView.hidden = NO;
    NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:3];
    UIImage *image0 = [UIImage imageNamed:@"common_rabbitBar_face0"];
    UIImage *image1 = [UIImage imageNamed:@"common_rabbitBar_face1"];
    [imageArray addObjectsFromArray:@[image0, image1]];
    self.smallImageView.animationImages = imageArray;
    self.smallImageView.animationDuration = 0.75;
    self.smallImageView.animationRepeatCount = 0;
    [_smallImageView startAnimating];
    [self.downView addSubview:_smallImageView];
    __weak typeof(self)weakSelf = self;
    [_smallImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.downView.mas_top);
        make.centerX.mas_equalTo(weakSelf.downView);
        make.width.height.mas_equalTo(@(30));
    }];
    
    self.downLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.downLabel.textColor = [UIColor lightGrayColor];
    self.downLabel.text = @"正在更新...";
    self.downLabel.font = [UIFont systemFontOfSize:11];
    [self.downView addSubview:_downLabel];
    [_downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.smallImageView.mas_bottom);
        make.centerX.mas_equalTo(weakSelf.smallImageView);
    }];
    // 执行block
    self.refreshBlock();
}

- (void)endRefresh {
    [NSThread sleepForTimeInterval:0.5];
    [self.smallImageView stopAnimating];
    self.downLabel.text = @"更新完成";
    [UIView animateWithDuration:0.25 animations:^{
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    } completion:^(BOOL finished) {
        self.downLabel.hidden = YES;
        self.smallImageView.hidden = YES;
    }];
}

//
- (void)setConentOffsetAnimation:(CGFloat)offsetY {
    [UIView animateWithDuration:0.25 animations:^{
        [self.scrollView setContentOffset:CGPointMake(0, offsetY) animated:NO];
    }];
}


// 由偏移量求得旋转弧度
- (CGFloat )radianOfContentOffSetY:(CGFloat )offSetY {
    return -M_PI_2 / 50 * offSetY - M_PI_2;
}

// 由偏移量求得alpha
- (CGFloat)alpahOfContentOffSetY:(CGFloat )offSetY {
    return -offSetY / 50 - 1.5;
}

- (void)startAntennaAnimation {
    if (_displayLink == nil) {
        _degree = 90; // 初始情况为90°
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink)];
        [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        _displayLink.frameInterval = 1; // 与屏幕hz一致
    }
    
}

int offset = 0;
- (void)handleDisplayLink {
    if (_degree >= 90) {
        offset = -4;
        
        // 2次后停止1秒
        _repeatNumber++;
        if (_repeatNumber == 4) {
            _repeatNumber = 0;
            _displayLink.paused = YES;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                _displayLink.paused = NO;
            });
        }
        
    }
    
    if (_degree <= 45 ) {
         offset = 4;
        
        UIView *view = [[UIView alloc] init];
        view.layer.borderWidth = 0.5;
        view.layer.borderColor = [UIColor whiteColor].CGColor;
        view.layer.cornerRadius = 4;
        [self addSubview:view];
        __weak typeof(self)weakSelf = self;
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.offset(15);
            make.height.offset(8);
            make.centerX.offset(0);
            make.centerY.mas_equalTo(weakSelf.downView.mas_top).offset(-22);
        }];
        
        [UIView animateWithDuration:0.6 animations:^{
            view.alpha = 0;
            view.transform = CGAffineTransformMakeScale(5, 5);
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
        }];
        
    }
    self.degree += offset;
}

- (void)stopAntennaAnimation {
    if (_displayLink != nil) {
        [_displayLink invalidate];
        _displayLink = nil;
        _repeatNumber = 1;
    }
    
}

// 设置角度
- (void)setDegree:(CGFloat)degree {
    if (_degree < 45) {
        _degree = 45;
    } else if (_degree > 90) {
        _degree = 90;
    } else {
        _degree = degree;
    }
    
    _leftAntenna.transform = CGAffineTransformMakeRotation(RadianOfDegree(_degree));
    _rightAntenna.transform = CGAffineTransformMakeRotation(-RadianOfDegree(_degree));
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end


#pragma mark-
#pragma mark - scrollView 分类

@implementation UIScrollView (RefreshView)

@dynamic refreshView;

static void * MyRefreshViewKey = (void *)@"MyRefreshViewKey";

- (void)setRefreshView:(AGRefreshViewTwo *)refreshView
{
    objc_setAssociatedObject(self, MyRefreshViewKey, refreshView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AGRefreshViewTwo *)refreshView
{
    return objc_getAssociatedObject(self, MyRefreshViewKey);
}


- (void)addRefreshViewWithFrame:(CGRect)frame refreshingBlock:(void (^)())block;
{
    AGRefreshViewTwo *refreshView = [[AGRefreshViewTwo alloc] initWithFrame:frame block:block scrollView:self];
    self.refreshView = refreshView;
    [self addSubview:refreshView];
}

@end












