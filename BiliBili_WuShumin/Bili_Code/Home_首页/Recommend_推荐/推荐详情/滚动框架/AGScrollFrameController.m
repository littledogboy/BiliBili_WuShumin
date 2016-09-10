//
//  AGScrollFrameController.m
//  FBLViewController
//
//  Created by 吴书敏 on 16/2/13.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#define kTop 20
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define kTotalWidth [UIScreen mainScreen].bounds.size.width
#define kTotalHeight [UIScreen mainScreen].bounds.size.height
#define kMenuHeight 44
#define kButtonWidth (kTotalWidth / _menuTitleArray.count) // 加上括号注意宏定义的替换,(后面更改，button的宽度与字数有关)


#import "AGScrollFrameController.h"
#import "AGMenuView.h" // 导入滚动时忽视点击视图

@interface AGScrollFrameController () <UIScrollViewDelegate>

@property (nonatomic, strong) AGMenuView *menuView; // 菜单滚动视图

@property (nonatomic, strong) UIScrollView *contentView; // 内容滚动视图

@property (nonatomic, strong) UIImageView *underLine; // 滚动条


@property (nonatomic, assign) NSInteger latestSelectedIndex; // 上一次选中下标

@property (nonatomic, assign) BOOL isSelected; // button是否选中，默认为no。

@property (nonatomic, strong) UIView *view2;

@end

@implementation AGScrollFrameController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO; //
    
    // menuView
    CGFloat width = 375;
    CGFloat height = 44;
    self.menuView = [[AGMenuView alloc] initWithFrame:(CGRectMake(0, 20, width, height))];
    _menuView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_menuView];

    // 画线 使用形状图层
    CAShapeLayer *bottomLine = [CAShapeLayer layer]; // 创建形状图层
    CGMutablePathRef path = CGPathCreateMutable(); // 创建路径
    [bottomLine setFillColor:[UIColor clearColor].CGColor]; // 填充颜色
    [bottomLine setStrokeColor:[UIColor grayColor].CGColor]; // 画线颜色
    bottomLine.lineWidth = 1.0f; // 线宽
    CGPathMoveToPoint(path, NULL, 0, 64); // 把画笔移到(0, 64)的位置
    CGPathAddLineToPoint(path, NULL, 375, 64); // 把画笔移到(375,64)的位置
    [bottomLine setPath:path]; // 添加画线
    CGPathRelease(path); // 释放画线
    [self.view.layer addSublayer:bottomLine]; // 添加形状图层
    
    // 添加button 和underLine
    [self setMunuView];
    
    // 添加 contentView
    [self setContentView];
    
    // Do any additional setup after loading the view.
}

#pragma mark-
#pragma mark setMunuView
/**
 *  设置菜单视图
 *  添加 button，添加滑动条
 */
- (void)setMunuView
{
    // 设置滚动条， 设置默认选中的按钮
    _selectedIndex = self.selectedIndex; // 默认选中按钮下标
    _latestSelectedIndex = self.selectedIndex; // 初始状态下，默认选中与上一次选中一样。
    
    self.menuTitleArray = self.menuTitleArray; // menu标题
    
    self.menuWidth = kTotalWidth; // 375
    self.menuHeight = kMenuHeight; // 44
    CGFloat buttonWidth = kTotalWidth / _menuTitleArray.count; // 375 / 4
    CGFloat buttonHeight = kMenuHeight;
    self.menuView.contentSize = CGSizeMake(_menuWidth, 44); // 设置可滑动大小
    
    // 设置滚动条
    self.underLine = [[UIImageView alloc] initWithFrame:(CGRectMake(_selectedIndex * buttonWidth, 0, buttonWidth, buttonHeight))];
    [_underLine setImage:[UIImage imageNamed:@"bg_underline_selected_44pt"]];
    _underLine.userInteractionEnabled = YES; // 打开用户交互
    [self.menuView addSubview:self.underLine];
    
    // 添加button
    for (int i = 0; i < _menuTitleArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)]; //  自定义button
        button.frame = CGRectMake(i * buttonWidth, 0, buttonWidth, buttonHeight);
        button.tag = i + 1;// tag从1开始
        [button setTitle:_menuTitleArray[i] forState:(UIControlStateNormal)];
        
        if (i == _selectedIndex) {
            [button setTitleColor:RGB(241, 117, 154) forState:(UIControlStateNormal)];
        }else {
            [button setTitleColor:RGB(154, 154, 154) forState:(UIControlStateNormal)];
        }
        // 241 117 154
        [button setTitleColor:RGB(241, 117, 154) forState:(UIControlStateHighlighted)];
        [button addTarget:self action:@selector(menuButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];

        [self.menuView addSubview:button];
    }
}


/**
 *  按钮事件
 *
 *  @param button 点击的菜单中的按钮
 */
- (void)menuButtonAction:(UIButton *)button
{
    // button按钮选中
    self.isSelected = YES;
    
    // 更改上一次选中下标
    self.latestSelectedIndex = self.selectedIndex;
    
    // 更改button当前选中下标
    self.selectedIndex = button.tag - 1;
    
    // 点击后更改当前normal标题颜色，把其他button颜色仍改为灰色
    [button setTitleColor:RGB(241, 117, 154) forState:(UIControlStateNormal)]; //  更改当前颜色
    
    // 把其他颜色改为灰色
    for (UIView *btn in self.menuView.subviews) {
        if ( ![btn isEqual:button] && [btn isKindOfClass:[UIButton class]]) {
            [(UIButton *)btn setTitleColor:RGB(154, 154, 154) forState:(UIControlStateNormal)];
        }
        
    }
    
    // 滚动underLine
    [UIView animateWithDuration:0.3 delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        
        // 更改x值
        CGRect frame = self.underLine.frame;
        CGRect newFrame = CGRectMake(_selectedIndex * frame.size.width, 0, frame.size.width, frame.size.height);
        _underLine.frame = newFrame;
        
    } completion:^(BOOL finished) {
        self.isSelected = NO;
    }];
    
    // 滑动contentView
    [self.contentView setContentOffset:(CGPointMake(_selectedIndex * kTotalWidth, 0)) animated:YES];
    
}


#pragma mark- setContentView

- (void)setContentView
{
   
    CGFloat contentViewY = self.menuView.frame.origin.y + kMenuHeight;
    self.contentView = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, contentViewY, kTotalWidth, kTotalHeight - contentViewY))];
    [self.view addSubview:_contentView];
    // 滚动属性
    _contentView.pagingEnabled = YES;
    _contentView.bounces = NO; // 不允许滚动回弹
    _contentView.delegate = self; // 代理
    _contentView.contentSize = CGSizeMake(kTotalWidth * _menuTitleArray.count, kTotalHeight - contentViewY); // contentSize
    _contentView.showsHorizontalScrollIndicator = NO; // 隐藏水平滚动条
    // 添加子视图    
    for (int i = 0; i < self.viewControllers.count; i++) {
        UIView *view = ((UIViewController *)self.viewControllers[i]).view;
        view.tag = i + 1; // 设置tag值
        CGPoint origin = CGPointMake(kTotalWidth * i, 0);
        CGRect frame = view.frame;
        frame.origin = origin;
        view.frame = frame;
        [self.contentView addSubview:view];
    }
}

#pragma mark-
#pragma mark contentView滚动代理方法
// 将要开始拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 更改上一次选中下标
    self.latestSelectedIndex = self.selectedIndex;
}


// 滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // menuOffSetX : menuContentSize.width = contentViewOffSetX : contentViewContentSize.width
    // 得出： menuOffSetX  = contentViewOffSetX : contentViewContentSize.width * menuContentSize.width
    
    // 获取contentView偏移量
    CGFloat contentViewOffX = scrollView.contentOffset.x;
    // 获取menuView偏移量
    CGFloat menuViewOffX = contentViewOffX / scrollView.contentSize.width * _menuView.contentSize.width;
    // 更改underLine的位置
    CGRect frame = self.underLine.frame;
    frame = CGRectMake(menuViewOffX, 0, frame.size.width, frame.size.height);
    // 当点击button时，underLinde也做位移动画，如果同时更改frame会冲突
    if (self.isSelected == NO) {
        self.underLine.frame = frame;
    }
    
    // 文字颜色渐变 RGB(241, 117, 154) --> RGB(154，154，154)
    // 分析：当移动的时候，总有一个按钮颜色由粉红--》灰色，一个按钮由灰色--》粉红
    // 需要更改两个button的颜色，更改时根据 button的相对偏移量比例来更改。
    // 重点：求出相对偏移量比例
    // 注意：因为不允许回弹，因此通过滚动可以获得的tag值为1 到count-1，最后一个button避免了越界问题。
    // 1. 求出contentView的tag，然后由此tag求得button的tag。
    NSInteger tag = contentViewOffX / kTotalWidth + 1; // 取整
    // 2. 获取button1
    UIButton *button1 = (UIButton *)[self.menuView viewWithTag:tag];
    // 3. 获取menu中相对button1的位移
    CGFloat buttonOffSetX = menuViewOffX - kButtonWidth * (tag - 1);
    // 4. 求得相对比例
    CGFloat percent = buttonOffSetX / kButtonWidth; // 果然是kButtonWidth的原因。
    // 5. 根据相对比例更改button1的字体颜色,比例一开始为0，随着移到下一个button或者上一个button变为1
    // 根据比例在颜色中求值 241...154 117...154 154...154
    // r随着percent增大而减小 241 -->154
    CGFloat r = [self percentValue:1 - percent min:154 max:241];
    // g随着percent增大而增大 117 -->154
    CGFloat g = [self percentValue:percent min:117 max:154];
    // b不变 154
    // 6. 更改button2的颜色
    UIButton *button2 = (UIButton *)[self.menuView viewWithTag:tag + 1];
    // 随着percent增大而增大  154-->241
    CGFloat r2 = [self percentValue:percent min:154 max:241];
    // 随着percent增大而减小  154-->117
    CGFloat g2 = [self percentValue:1 - percent  min:117 max:154];
    // b不变 154
    
    // 滚动时更改button颜色
//    if (self.isSelected == NO) { 
        [button1 setTitleColor:RGB(r, g, 154) forState:(UIControlStateNormal)];
        [button2 setTitleColor:RGB(r2, g2, 154) forState:(UIControlStateNormal)];
//    }
}


// 手动滚动已经停止滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 更改button的selectedIndex
    CGFloat offSetX = scrollView.contentOffset.x;
    NSInteger index = offSetX / kTotalWidth;
    self.selectedIndex = index;
    
    // 更改button的字体颜色
    for (UIView *btn in self.menuView.subviews) {
        
        if ([btn isKindOfClass:[UIButton class]] && btn.tag == self.selectedIndex + 1) {
            [(UIButton *)btn setTitleColor:RGB(241, 117, 154) forState:(UIControlStateNormal)];
        } else if ([btn isKindOfClass:[UIButton class]]) {
            [(UIButton *)btn setTitleColor:RGB(154, 154, 154) forState:(UIControlStateNormal)];
        }
    }
    
}


#pragma mark-
#pragma mark 根据percent求min...max 之间的值
- (CGFloat)percentValue:(CGFloat)percent min:(CGFloat)min max:(CGFloat)max
{
    // value的值 随着percent增大而增大
    
    // 百分比 * max 和 min之间的差值
    CGFloat value = min; // 初始为min
    CGFloat changeValue = percent * (max - min); //
    value = min +  changeValue; // 当percent为0时value最小为min，当percent为1时value最大为max
    return value;
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
