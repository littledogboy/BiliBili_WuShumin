//
//  HomeViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/8/23.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#define topViewHeight 54
#define titleMargin  32 // 标题间距
#define titleWidth 40 // 标题宽度
#define titleHeight 21 //
#define menuWidth 184
#define menuHeiht 34
#define underlineHeight 2
#define underlineBottom 3
#define contentViewHeight screenHeight - topViewHeight - 49

#define sukura_selectedColor RGBCOLOR(255, 255, 255)
#define sukura_unselectedColor RGBCOLOR(255, 224, 238)

#define  contentViewCellIdentifier @"contentViewCellIdentifier"

#import "HomeViewController.h"
#import "UIView+Frame.h"

@interface HomeViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, assign) BOOL isSelected; // button是否选中
@property (nonatomic, assign) CGFloat menuViewWidth;

@end

@implementation HomeViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        // 默认值
        self.selectedIndex = 0;
        self.isHiddrenUnderLine = NO;
    }
    return self;
}

- (void)setViewControllers:(NSArray *)viewControllers {
    if (viewControllers != nil) {
        _viewControllers = [viewControllers copy];
        for (UIViewController *vc in _viewControllers) {
           [self addChildViewController:vc];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
    // 1. topView
    [self addTopView];
    // 2. menuView
    [self addMenuView];
    // 3. setTitle
    [self setMenuTitle];
    // 4. contentView
    [self addContentView];
}

- (void)addTopView {
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, topViewHeight)];
    self.topView.backgroundColor = SAKURACOLOR;
    [self.view addSubview:self.topView];
}

- (void)addMenuView {
    self.menuViewWidth = self.menuTitleArray.count * titleWidth + (self.menuTitleArray.count - 1) * titleMargin;
    CGFloat menuX = (screenWidth - self.menuViewWidth) / 2.0;
    self.menuView = [[UIScrollView alloc] initWithFrame:CGRectMake(menuX, 20, self.menuViewWidth, menuHeiht)];
    self.menuView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_menuView];
}

- (void)setMenuTitleArray:(NSArray *)menuTitleArray {
    if (_menuTitleArray != menuTitleArray) {
        _menuTitleArray = menuTitleArray;
    }
}

- (void)setMenuTitle {
    _lastSelectedIndex = _selectedIndex;
    
    // 设置滚动条
    CGFloat underLineX = _selectedIndex * (titleWidth + titleMargin);
    CGFloat underLineY = menuHeiht - underlineBottom - underlineHeight;
    self.underLineView = [[UIView alloc] initWithFrame:CGRectMake(underLineX, underLineY, titleWidth, underlineHeight)];
    self.underLineView.hidden = self.isHiddrenUnderLine;
    self.underLineView.backgroundColor = sukura_selectedColor;
    [self.menuView addSubview:_underLineView];
    
    // 添加title
    for (int i = 0; i < _menuTitleArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        CGFloat buttonX = i * (titleWidth + titleMargin);
        button.frame = CGRectMake(buttonX, 3, titleWidth, titleHeight);
        button.tag = i + 1; //
        [button setTitle:_menuTitleArray[i] forState:(UIControlStateNormal)];
        
        // titleColor
        if (i == _selectedIndex) {
            [button setTitleColor:sukura_selectedColor forState:(UIControlStateNormal)];
        } else {
            [button setTitleColor:sukura_unselectedColor forState:(UIControlStateNormal)];
        }
        [button setTitleColor:sukura_selectedColor forState:(UIControlStateHighlighted)];
        
        // action
        if (self.childViewControllers.count > 1) {
            [button addTarget:self action:@selector(menuButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        }
        
        // add
        [self.menuView addSubview:button];
    }
}

- (void)menuButtonAction:(UIButton *)button {
    self.isSelected = YES; // button为选中状态
    self.lastSelectedIndex = self.selectedIndex; // 更改上次选中下标
    self.selectedIndex = button.tag - 1; // 更改当前选中下标
    // 更改title颜色
    [button setTitleColor:sukura_selectedColor forState:(UIControlStateNormal)];
    for (UIView *btn in self.menuView.subviews) {
        if (![btn isEqual:button] && [btn isKindOfClass:[UIButton class]]) {
            [(UIButton *)btn setTitleColor:sukura_unselectedColor forState:(UIControlStateNormal)];
        }
    }
    // 滚动underLine
    [UIView animateWithDuration:0.2 delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        CGRect frame = self.underLineView.frame;
        CGRect newFrame = CGRectMake(_selectedIndex * (titleWidth + titleMargin), frame.origin.y, frame.size.width, frame.size.height);
        _underLineView.frame = newFrame;
    } completion:^(BOOL finished) {
        //
    }];
    // 滚动contentView
    [self.contentView setContentOffset:CGPointMake(screenWidth * _selectedIndex, 0) animated:YES];
}

- (void)addContentView {
    CGRect contentViewFrame = CGRectMake(0, topViewHeight, screenWidth, screenHeight - topViewHeight - 49);
    // collectionViewLayout
    UICollectionViewFlowLayout *contentViewLayout = [[UICollectionViewFlowLayout alloc] init];
    contentViewLayout.sectionInset = UIEdgeInsetsZero;
    contentViewLayout.itemSize = contentViewFrame.size;
    contentViewLayout.minimumLineSpacing = 0;
    contentViewLayout.minimumInteritemSpacing = 0;
    contentViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal; // 水平滚动
    
    self.contentView = [[UICollectionView alloc] initWithFrame:contentViewFrame collectionViewLayout:contentViewLayout];
    _contentView.delegate = self;
    _contentView.dataSource = self;
    _contentView.pagingEnabled = YES;
    _contentView.bounces = NO; // 关闭滚动回弹
    _contentView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_contentView];
    
    // registCell
    [_contentView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:contentViewCellIdentifier];
    // contentOffSet
    [_contentView setContentOffset:CGPointMake(screenWidth * _selectedIndex, 0) animated:NO];
}

#pragma mark- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _menuTitleArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:contentViewCellIdentifier forIndexPath:indexPath];
    // 移除所有子控件
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    // 添加子控制器
    UIViewController *viewController = self.viewControllers[indexPath.item];
    viewController.view.frame = CGRectMake(0, 0, screenWidth, contentViewHeight);
    [cell.contentView addSubview:viewController.view];
    
    return cell;
}


#pragma mark- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 1. 更改underLine
    // k = width + margin
    // x = offX / contWidth
    // 获取underLine要滚动的位置
    CGFloat contentViewOffX = scrollView.contentOffset.x;
    CGFloat menuViewOffX = contentViewOffX / scrollView.frame.size.width * (titleWidth + titleMargin);
    // *注意不要与点击button的动画冲突
    if (self.isSelected == NO) {
         _underLineView.x = menuViewOffX;
    }
    // 2. title文字颜色渐变(整体渐变)
    // > 1. 当前对应的button1 button2
    NSInteger tag = contentViewOffX / screenWidth + 1; // offset对应的button
    UIButton *button1 = (UIButton *)[self.menuView viewWithTag:tag];
    UIButton *button2 = (UIButton *)[self.menuView viewWithTag:tag + 1];
    // > 2. 求得相对button1的位移
    CGFloat buttonOffSetX = menuViewOffX - (titleWidth + titleMargin) * (tag - 1);
    // > 3. 求得相对比例， 当移动到上一个或者下一个button时比例为1
    CGFloat percent = buttonOffSetX / (titleWidth + titleMargin);
    // > 4. 根据比例更改颜色
    // #define sukura_selectedColor RGBCOLOR(255, 255, 255)
    // #define sukura_unselectedColor RGBCOLOR(255, 224, 238)
    // 主题更改时添加if
    // 更改button1颜色
    CGFloat r1 = [self percentValue:percent min:255 max:255];
    CGFloat g1 = [self percentValue:1 - percent min:224 max:255];
    CGFloat b1 = [self percentValue:1 - percent min:238 max:255];
    // 更改button2颜色
    CGFloat r2 = [self percentValue:percent min:255 max:255];
    CGFloat g2 = [self percentValue:percent min:224 max:255];
    CGFloat b2 = [self percentValue:percent min:238 max:255];
    
    [button1 setTitleColor:RGBCOLOR(r1, g1, b1) forState:(UIControlStateNormal)];
    [button2 setTitleColor:RGBCOLOR(r2, g2, b2) forState:(UIControlStateNormal)];
}

// 手动拖动才执行
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 更改selectedIndex
    CGFloat offSetX = scrollView.contentOffset.x;
    NSInteger index = offSetX / scrollView.frame.size.width;
    self.selectedIndex = index;
    // 更改button颜色
    for (UIView *btn in self.menuView.subviews) {
        if ([btn isKindOfClass:[UIButton class]] && btn.tag == self.selectedIndex + 1) {
            [(UIButton *)btn setTitleColor:sukura_selectedColor forState:(UIControlStateNormal)];
        } else if ([btn isKindOfClass:[UIButton class]]) {
            [(UIButton *)btn setTitleColor:sukura_unselectedColor forState:(UIControlStateNormal)];
        }
    }
}

// 非手动拖动才执行
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    self.isSelected = NO; // 点击滚动动画结束后
}

- (CGFloat)percentValue:(CGFloat)percent min:(CGFloat)min max:(CGFloat)max {
    CGFloat value = min;
    CGFloat changeValue = percent * (max - min);
    value = min + changeValue;
    return value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- 状态条颜色
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
