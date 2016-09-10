//
//  HotPromoteScrollView.h
//  热门推荐详情页面
//
//  Created by 吴书敏 on 16/6/13.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HotPromoteScrollViewDelegate <NSObject>
// leftView rightView  scroll call
- (void)scrollViewDidScrollConentOffset:(CGFloat)contentOffset;
@end


@interface HotPromoteScrollView : UIView

// leftButton
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) NSString *leftButtonTitle;
// rightButton
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) NSString *rightButtonTitle;
// numberLabel
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) NSString *numberLabelText;
// horizontalScrollIndicator
@property (nonatomic, strong) UIView *scrollIndicator;
// separateLine
@property (nonatomic, strong) UIView *separeteLine;

// scrollView
@property (nonatomic, strong) UIScrollView *scrollView;
// selectedIndex
@property (nonatomic, assign) NSInteger selectedIndex; // 从1开始 ： 1 2
// leftRightView
@property (nonatomic, assign) UIScrollView *leftView;
@property (nonatomic, strong) UIScrollView *rightView;

//
@property (nonatomic, assign) CGFloat contentOffsetY;
//
@property (nonatomic, assign) id<HotPromoteScrollViewDelegate> delegate;

@end
