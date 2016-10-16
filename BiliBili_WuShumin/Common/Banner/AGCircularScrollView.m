//
//  AGCircularScrollView.m
//  AGCircularScrollView
//
//  Created by 吴书敏 on 16/2/24.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#define  kTotalWidth  self.frame.size.width
#define  kTotalHeight  self.frame.size.height
#define  kScrollInterval 4


#import "AGCircularScrollView.h"
#import "BannerImage.h"
#import "AGWebViewController.h"

@interface AGCircularScrollView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) NSTimer *timer;

// model 映射
@property (nonatomic, strong) NSString *imageMapKey;

@end

@implementation AGCircularScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addScrollView];
    }
    
    return self;
}


//重写代理方法，添加观察者
- (void)setDelegate:(id<BannerImageViewDelegate>)delegate
{
    _delegate = delegate;
    [self addObserver];
}



#pragma mark-
#pragma mark 添加scrollView
- (void)addScrollView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.scrollView.backgroundColor = [UIColor yellowColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self; // 设置滚动代理
    [self addSubview:self.scrollView];
}


- (void)updateScrollView
{
    self.scrollView.contentSize = CGSizeMake(kTotalWidth * (self.bannerImageModel.count + 1), 44);
    self.scrollView.contentOffset = CGPointMake(kTotalWidth, 0); // 1x 偏移量
    
    // 给scrollView添加子视图
    // 循环滚动需要设置衔接图，第一张为最后一张，
    for (int i = 0; i < self.bannerImageModel.count + 1 ; i++) {
        
        // 第一张的图片为，数组中最后一张图片
        if (i == 0) {
            BannerImageView *bannerImageView = [[BannerImageView alloc] initWithFrame:CGRectMake(0, 0, kTotalWidth, kTotalHeight)];
            bannerImageView.delegate = self.delegate; // 添加代理
            if (self.imageMapKey == nil) {
                bannerImageView.bannerImage = [self.bannerImageModel lastObject]; // 最后一个元素
            } else {
                [bannerImageView registerImagePropertyName:self.imageMapKey];
                bannerImageView.bannerImageModel = [self.bannerImageModel lastObject];
            }
            
            // target Action
            [self.scrollView addSubview:bannerImageView];
        } else {
            BannerImageView *bannerImageView = [[BannerImageView alloc] initWithFrame:CGRectMake(i * kTotalWidth, 0, kTotalWidth, kTotalHeight)];
            bannerImageView.delegate = self.delegate; // 添加代理
            if (self.imageMapKey == nil) {
                bannerImageView.bannerImage = self.bannerImageModel[i - 1];
            } else {
                [bannerImageView registerImagePropertyName:self.imageMapKey];
                bannerImageView.bannerImageModel = self.bannerImageModel[i - 1];
            }
            // target action
            [self.scrollView addSubview:bannerImageView];
        }
    }
    
    // 添加自动滚动
    [self addTimer]; //
}


#pragma mark-
#pragma mark 添加pageControl
- (void)addPageControl
{
    CGFloat width = 13 * self.bannerImageModel.count;
    CGFloat height = 37;
    CGFloat pcX = self.frame.size.width - 20 - width;
    CGFloat pcY = self.frame.size.height  - height + 8;
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(pcX, pcY, width, height)];
    _pageControl.numberOfPages = self.bannerImageModel.count;
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [self addSubview:_pageControl];
}


#pragma mark- registerImageMapKey

- (void)registerImageMapKey:(NSString *)imageKey {
    self.imageMapKey = imageKey;
}

#pragma mark-
#pragma mark 重写model的set方法
// 当有model有数据了之后，根据数组长度添加scrollView子视图和添加pageControl
- (void)setBannerImageModel:(NSArray *)bannerImageModel
{
    _bannerImageModel = bannerImageModel;
    
    [self updateScrollView]; // 给scrollView添加子视图
    [self addPageControl]; // 添加pageControl
}


#pragma mark-
#pragma mark scrollViewDelegate 停止开始计时器

// 滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 当前偏移量
    CGFloat offSetX = scrollView.contentOffset.x;
    
    CGFloat maxOffSetX = scrollView.contentSize.width - kTotalWidth;
    CGFloat minOffSetX = 0;
    
    // 右循环滚动
    if (offSetX > maxOffSetX) {
        [scrollView setContentOffset:(CGPointMake(minOffSetX, 0)) animated:NO];
    } else if (offSetX < minOffSetX) { // 左循环滚动
        [scrollView setContentOffset:(CGPointMake(maxOffSetX, 0)) animated:NO];
    }
}

// 开始拖拽，停止计时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 停止计时器
    [self stopTimer];
}



#pragma mark-
#pragma mark 滚动更改pageControl

// 手动滚动停止，更改pageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self changePageControl];
    
    // 手动滚动停止，恢复计时器
    [self resumeTimer];
}

// 滚动动画停止，非手动滑动
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self changePageControl];
}

// 根据scroll偏移量更改pageControl
- (void)changePageControl
{
    // 当前偏移量
    CGFloat offSetX = self.scrollView.contentOffset.x;
    
    NSInteger index = self.bannerImageModel.count;
    if (offSetX > 0) {
        index = offSetX / kTotalWidth - 1;
    }
    
    self.pageControl.currentPage = index;
}


#pragma mark-
#pragma mark 添加自动滚动
- (void)addTimer
{
    // 注意： timer 只设置一次，这样才能保持一致。否则设置多次会出现bug
    if (self.timer == nil) {
        // 添加计时器，并添加到当前线程
        self.timer = [NSTimer timerWithTimeInterval:kScrollInterval target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
        // 获取到当前线程的runloop ，添加定时器. defaultrunloopMode 会在UI滚动时，比如UIScrollView的拖动操作，会将Run Loop切换成NSEventTrackingRunLoopMode模式，在这个过程中，默认的NSDefaultRunLoopMode模式中注册的事件是不会被执行的。
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    }
}

// 自动滚动
- (void)timerFireMethod:(NSTimer *)timer
{
    // 当前偏移量
    CGFloat offSetX = self.scrollView.contentOffset.x;
    
    CGFloat maxOffSetX = self.scrollView.contentSize.width - kTotalWidth;
    CGFloat minOffSetX = 0;
    
    // 如果已经是最大偏移，则定到最小偏移，然后再滚动
    if (offSetX >= maxOffSetX) {
        [self.scrollView setContentOffset:(CGPointMake(minOffSetX, 0)) animated:NO];
        [self.scrollView setContentOffset:(CGPointMake(kTotalWidth, 0)) animated:YES];
    } else {
         [self.scrollView setContentOffset:(CGPointMake(offSetX + kTotalWidth, 0)) animated:YES];
    }
}

// 恢复计时器
- (void)resumeTimer
{
    [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:kScrollInterval]];
}


// 停止计时器
- (void)stopTimer
{
    [self.timer setFireDate:[NSDate distantFuture]]; // 创建一个很大的日期，可以认为永远不会被执行
}




#pragma mark-
#pragma mark 进入下级页面时，停止定时器，返回时，开始定时器。
// 使用 kvo 设计模式
- (void)addObserver
{

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
