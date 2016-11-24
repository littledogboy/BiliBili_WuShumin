//
//  LivePlayView.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/11/15.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "LivePlayView.h"
#import "AGScrollFrameController.h"

@interface LivePlayView ()

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *midView;
@property (nonatomic, strong) UIView *agScrollFrameView; // 滚动
@property (nonatomic, strong) UIView *giftView; // 发弹幕，礼物

// midView subView
@property (nonatomic, strong) UIImageView *upCoverImageView;
@property (nonatomic, strong) UIButton *liveTitleButton;
@property (nonatomic, strong) UIImageView *titleImageView;
@property (nonatomic, strong) UIButton *upLevelButton;
@property (nonatomic, strong) UIButton *upNameButton;
@property (nonatomic, strong) UIButton *attentionNumberButton;
@property (nonatomic, strong) UIButton *attentionButton;
@property (nonatomic, strong) UIImageView *onlineImageView;
@property (nonatomic, strong) UILabel *onlineNumberLabel;

//
@property (nonatomic, strong) UIView *lineView;

@end

@implementation LivePlayView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    // topView
    self.topView = [[UIView alloc] initWithFrame:CGRectZero];
    self.topView.backgroundColor = RGBCOLOR(244, 244, 244);
    [self addSubview:_topView];
    WS(ws);
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(ws);
        make.height.mas_equalTo(ws.topView.width).multipliedBy(210/375.0);
    }];
    
    // midView
    self.midView = [[UIView alloc] initWithFrame:CGRectZero];
    self.midView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_midView];
    [_midView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.topView.bottom);
        make.left.right.equalTo(ws);
        make.height.equalTo(@(85)); // 170px
    }];
    
    // coverImageview
    self.upCoverImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _upCoverImageView.backgroundColor = [UIColor redColor];
    _upCoverImageView.layer.cornerRadius = 30;
    _upCoverImageView.layer.masksToBounds = YES;
    [self.midView addSubview:_upCoverImageView];
    [_upCoverImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@(12));
        make.width.height.equalTo(@(60));
    }];
    
    // liveTitleButton
    self.liveTitleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _liveTitleButton.frame = CGRectZero;
    _liveTitleButton.adjustsImageWhenHighlighted = NO;
    [_liveTitleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_liveTitleButton setTitle:@"逃学回来，深空远征！其实因为头疼" forState:UIControlStateNormal];
    [_liveTitleButton addTarget:self action:@selector(liveInfoAction) forControlEvents:(UIControlEventTouchUpInside)];
    _liveTitleButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.midView addSubview:_liveTitleButton];
    [_liveTitleButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.midView.top).offset(10);
        make.left.equalTo(ws.upCoverImageView.right).offset(12);
        make.right.lessThanOrEqualTo(ws.midView.right).offset(-26);
        make.height.equalTo(@(15));
    }];
    
    // titleImageView
    self.titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"live_info_ico"]];
    [self.midView addSubview:_titleImageView];
    [_titleImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.liveTitleButton.right).offset(5);
        make.centerY.equalTo(ws.liveTitleButton);
        make.height.equalTo(@(14));
        make.width.equalTo(@(9));
    }];
    
    // upLevelButton
    self.upLevelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_upLevelButton setBackgroundColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [_upLevelButton setTitle:@"UP20" forState:UIControlStateNormal];
    _upLevelButton.titleLabel.font = [UIFont systemFontOfSize:12];
    _upLevelButton.adjustsImageWhenHighlighted = NO;
    _upLevelButton.layer.cornerRadius = 3;
    _upLevelButton.layer.masksToBounds = YES;
    [self.midView addSubview:_upLevelButton];
    [_upLevelButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.liveTitleButton);
        make.top.equalTo(ws.liveTitleButton.bottom).offset(10);
        make.width.greaterThanOrEqualTo(@(35));
        make.height.equalTo(@(17));
    }];
    
    // upNameButton
    self.upNameButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _upNameButton.adjustsImageWhenHighlighted = NO;
    [_upNameButton setTitleColor:SAKURACOLOR forState:UIControlStateNormal];
    [_upNameButton setTitle:@"不想写作业的星辉酱" forState:UIControlStateNormal];
    _upNameButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [_upNameButton addTarget:self action:@selector(upInfoAction) forControlEvents:UIControlEventTouchUpInside];
    [self.midView addSubview:_upNameButton];
    [_upNameButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.upLevelButton.right).offset(10);
        make.centerY.equalTo(ws.upLevelButton);
        make.width.lessThanOrEqualTo(@(120));
        make.height.equalTo(ws.upLevelButton);
    }];
    
    // attentionButton
    self.attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_attentionButton setTitle:@"+关注" forState:UIControlStateNormal];
    [_attentionButton setTitleColor:SAKURACOLOR forState:UIControlStateNormal];
    _attentionButton.titleLabel.font = [UIFont systemFontOfSize:14];
    _attentionButton.layer.cornerRadius = 3.0;
    _attentionButton.layer.borderWidth = 1.0;
    _attentionButton.layer.borderColor = SAKURACOLOR.CGColor;
    _attentionButton.layer.masksToBounds = YES;
    [_attentionButton addTarget:self action:@selector(attentionAction) forControlEvents:UIControlEventTouchUpInside];
    [self.midView addSubview:_attentionButton];
    [_attentionButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.upLevelButton.top);
        make.right.equalTo(ws.right).offset(-12);
        make.width.equalTo(@(60));
        make.height.equalTo(@(30));
    }];
    
    // attentionNumberLabel
    self.attentionNumberButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _attentionNumberButton.adjustsImageWhenHighlighted = NO;
    UIImage *cornerImage = [UIImage imageNamed:@"live_corner_ico"];
    UIImage *pattenImage = [cornerImage resizableImageWithCapInsets:UIEdgeInsetsMake(7, 8, 7, 8)];
    [_attentionNumberButton setBackgroundImage:pattenImage forState:UIControlStateNormal];
    _attentionNumberButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [_attentionNumberButton setTitle:@"1.2万" forState:UIControlStateNormal];
    [_attentionNumberButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.midView addSubview:_attentionNumberButton];
    [_attentionNumberButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.attentionButton.left).offset(-5);
        make.centerY.equalTo(ws.attentionButton);
        make.height.equalTo(@(27));
        make.width.greaterThanOrEqualTo(@(40));
    }];
    
    // onLineImageView
    self.onlineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"live_eye_ico"]];
    _onlineImageView.frame = CGRectZero;
    [self.midView addSubview:_onlineImageView];
    [_onlineImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.upLevelButton.left);
        make.top.equalTo(ws.upLevelButton.bottom).offset(10);
        make.width.equalTo(12);
        make.height.equalTo(8.5);
    }];
    
    // onLineNumberLabel
    self.onlineNumberLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.onlineNumberLabel.text = @"441";
    self.onlineNumberLabel.textColor = [UIColor grayColor];
    self.onlineNumberLabel.font = [UIFont systemFontOfSize:11];
    [self.midView addSubview:_onlineNumberLabel];
    [_onlineNumberLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.onlineImageView.right).offset(3);
        make.centerY.equalTo(ws.onlineImageView);
        make.height.equalTo(15);
    }];
    
    //
    self.lineView = [[UIView alloc] initWithFrame:CGRectZero];
    _lineView.backgroundColor = RGBCOLOR(205, 205, 205);
    [self addSubview:_lineView];
    [_lineView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.midView.bottom);
        make.left.right.equalTo(self);
        make.height.equalTo(@(1));
    }];
    return self;
}

#pragma mark- liveInfo

- (void)liveInfoAction {
    // 直播信息
}

- (void)upInfoAction {
    // up信息
}

- (void)attentionAction {
    // 关注
}

@end
