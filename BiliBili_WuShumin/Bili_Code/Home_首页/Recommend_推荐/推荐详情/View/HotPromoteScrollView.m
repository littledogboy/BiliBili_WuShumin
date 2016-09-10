//
//  HotPromoteScrollView.m
//  热门推荐详情页面
//
//  Created by 吴书敏 on 16/6/13.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "HotPromoteScrollView.h"
#import "Masonry.h"
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]


@interface HotPromoteScrollView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIColor *normalColor;

@property (nonatomic, strong) UIColor *selectedColor;

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, assign) BOOL isSelected;

@end

@implementation HotPromoteScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.normalColor =  RGB(154, 154, 154);
        self.selectedColor = RGB(211, 123, 147);
        self.selectedIndex = 1;
        
        [self addLeftButton];
        [self addRightButton];
        [self addSeparateLine];
        [self addNumberLabel];
        [self addscrollIndicator];
        [self addScrollView];
    }
    return self;
}


#pragma mark-
#pragma mark addSubView
- (void)addLeftButton
{
    self.leftButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.leftButton.tag = 1;
    if (self.leftButton.tag == self.selectedIndex) {
        [self.leftButton setTitleColor:_selectedColor forState:(UIControlStateNormal)];
    } else {
        [self.leftButton setTitleColor:_normalColor forState:(UIControlStateNormal)];
    }
    [self.leftButton setTitleColor:_selectedColor forState:UIControlStateHighlighted];
    self.leftButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.leftButton addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self addSubview:_leftButton];
    [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.right.equalTo(self.mas_centerX);
        make.width.equalTo(@(90));
        make.height.equalTo(@(32));
    }];
}


- (void)setLeftButtonTitle:(NSString *)leftButtonTitle
{
    [self.leftButton setTitle:leftButtonTitle forState:(UIControlStateNormal)];
}


- (void)addRightButton
{
    self.rightButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.rightButton.tag = 2;
    if (self.rightButton.tag == self.selectedIndex) {
        [self.rightButton setTitleColor:_selectedColor forState:(UIControlStateNormal)];
    } else {
        [self.rightButton setTitleColor:_normalColor forState:(UIControlStateNormal)];
    }
    [self.rightButton setTitleColor:_selectedColor forState:UIControlStateHighlighted];
    self.rightButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.rightButton addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self addSubview:_rightButton];
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self.mas_centerX);
        make.width.equalTo(@(90));
        make.height.equalTo(@(32));
    }];

}


- (void)setRightButtonTitle:(NSString *)rightButtonTitle
{
    [self.rightButton setTitle:rightButtonTitle forState:(UIControlStateNormal)];
}


- (void)addSeparateLine
{
    self.separeteLine = [[UIView alloc] init];
    self.separeteLine.backgroundColor = self.normalColor;
    [self addSubview:_separeteLine];
    [_separeteLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.leftButton.mas_bottom);
        make.left.right.equalTo(self);
        make.height.equalTo(@(0.5));
    }];
}


- (void)addNumberLabel
{
    self.numberLabel = [[UILabel alloc] init];
    self.numberLabel.textColor = self.normalColor;
    self.numberLabel.font = [UIFont systemFontOfSize:8];
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    self.numberLabel.layer.borderWidth = 1;
    self.numberLabel.layer.borderColor = self.normalColor.CGColor;
    self.numberLabel.layer.cornerRadius = 7.5;
    
    [self addSubview:self.numberLabel];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rightButton.mas_centerY);
        make.left.equalTo(self.rightButton.mas_centerX).offset(15);
        make.height.equalTo(@(15));
        make.width.greaterThanOrEqualTo(@20);
    }];
}


- (void)setNumberLabelText:(NSString *)numberLabelText
{
    NSString *newString = [NSString stringWithFormat:@"%@    ", numberLabelText];
    self.numberLabel.text = newString;
}


- (void)addscrollIndicator
{
    self.scrollIndicator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_underline_selected_44pt"]];
    [self addSubview:_scrollIndicator];
    [_scrollIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self.leftButton.mas_left).offset((_selectedIndex - 1) * 90);
        make.width.height.equalTo(self.leftButton);
    }];
}


- (void)addScrollView
{
    self.scrollView = [[UIScrollView alloc] init];
    _scrollView.delegate = self;
    _scrollView.backgroundColor = [UIColor grayColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    [self addSubview:_scrollView];

    [self layoutIfNeeded]; // must refresh layout, othersise the frame may zero
    CGFloat scrollViewY = _separeteLine.frame.origin.y + _separeteLine.frame.size.height;
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.separeteLine.mas_bottom);
        make.left.width.equalTo(self);
        make.height.equalTo(self).offset(-scrollViewY);
    }];
    
    self.contentView = [[UIView alloc] init];
    [self.scrollView addSubview:_contentView];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.height.equalTo(self.scrollView);
    }];
}


- (void)setLeftView:(UIScrollView *)leftView
{
    if (_leftView != leftView) {
        _leftView = leftView;
        _leftView.delegate = self;
        
        [self.contentView addSubview:_leftView];
        [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@(0));
            make.height.equalTo(_contentView.mas_height); //
            make.width.equalTo(self.scrollView);
        }];
        
        [_contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.leftView.mas_right).priority(MASLayoutPriorityDefaultLow);
        }];
    }
}


- (void)setRightView:(UIView *)rightView
{
    if (_rightView != rightView) {
        _rightView = rightView;
        
        [self.contentView addSubview:_rightView];
        [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftView.mas_right);
            make.top.width.height.equalTo(self.leftView);
        }];
        
        [_contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.rightView.mas_right);
        }];
    }
}


#pragma mark-
#pragma mark  buttonAction:

- (void)buttonAction:(UIButton *)button
{
    // 1. change selectedIndex 、 button color
    self.selectedIndex = button.tag;
    for (UIView *view in self.subviews) {
        // 是否是给定类的一个实例
        // isKindOfClass 是否为给定类的实例，或者给定类子类的一个实例
        if ([view isMemberOfClass:[UIButton class]]) {
            if (view.tag != button.tag) {
                [(UIButton *)view setTitleColor:_normalColor forState:(UIControlStateNormal)];
            }
            if (view.tag == button.tag) {
                [(UIButton *)view setTitleColor:_selectedColor forState:(UIControlStateNormal)];
            }
        }
    }
    
    // 2. remake scroll Indicatior constraints
    [self.scrollIndicator mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self.leftButton.mas_left).offset((_selectedIndex - 1) * 90);
        make.width.height.equalTo(self.leftButton);
    }];
    // make 约束用于第一次给视图添加约束
    // update 用于更新某个，后者某几个约束。多用于改变 make 中的某个约束。
    // remake 重新添加约束，会把之前的所有约束清除掉，然后再重新添加。 多用于一次性更改多个约束。 防止约束冲突。
    
    // 3. set scrollView contentOffset
    // 点击button 时，滚动指示器不做动画，只有拖动时才做动画。
    self.isSelected = YES;
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width * (_selectedIndex - 1), 0) animated:YES];
}


#pragma mark-
#pragma mark UIScrollDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.scrollView]) {
        
        // 思路： 让指示条滚动的比例 与 scrollView 偏移的比例一样
        // so: (indicationView.x - leftButton.x ) / (leftButtonWith + rightButtonWidth)
        // = offSetX / scrollView.contentSize.width
        // we can get thte indicationView.x = offSetX * (leftButtonWith + rightButtonWidth) /  scrollView.contentSize.width + leftButton.x
        CGFloat offSetX = scrollView.contentOffset.x;
        CGFloat buttonWidth = _leftButton.frame.size.width;
        CGFloat contentWidth = scrollView.contentSize.width;
        CGFloat leftButtonX = _leftButton.frame.origin.x;
        CGFloat indicationX = (offSetX * 2 * buttonWidth) / contentWidth + leftButtonX;
        
        if (self.isSelected == NO) {
            [_scrollIndicator mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@(indicationX));
                make.top.equalTo(self);
                make.width.height.equalTo(self.leftButton);
            }];
        }
        
    } else {  // scrollView is leftView OR rightView
        
        if ([scrollView isEqual:self.leftView]) {
            self.contentOffsetY = _leftView.contentOffset.y;
        } else {
            self.contentOffsetY = _rightView.contentOffset.y;
        }
        
        // 发布通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"KScroll" object:scrollView userInfo:@{ @"contentOffsetY" : @(_contentOffsetY)}];
        
        if (self.delegate != nil && [_delegate respondsToSelector:@selector(scrollViewDidScrollConentOffset:)]) {
            [_delegate scrollViewDidScrollConentOffset:self.contentOffsetY];
        }
    }
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.isSelected = NO;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offSetX = scrollView.contentOffset.x;
    CGFloat scrollViewWidth = scrollView.frame.size.width;
    NSInteger pageNumber = offSetX / scrollViewWidth;
    self.selectedIndex = pageNumber + 1;
    
    // change selected button normal color
    for (UIView *view in self.subviews) {
        if ([view isMemberOfClass:[UIButton class]]) {
            if (view.tag != self.selectedIndex) {
                [(UIButton *)view setTitleColor:_normalColor forState:(UIControlStateNormal)];
            }
            if (view.tag == self.selectedIndex) {
                [(UIButton *)view setTitleColor:_selectedColor forState:(UIControlStateNormal)];
            }
        }
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
