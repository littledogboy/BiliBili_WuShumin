//
//  BungumiHeaderView.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/14.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "BungumiHeaderView.h"
#import "BungumiCaterotyTouchView.h"
#import "AGCircularScrollView.h"

@interface BungumiHeaderView ()

@property (strong, nonatomic) IBOutlet UIView *topView;
@property (nonatomic, strong)  AGCircularScrollView *agCSV;

@property (strong, nonatomic) IBOutlet BungumiCaterotyTouchView *lianzaiTouchView;
@property (strong, nonatomic) IBOutlet BungumiCaterotyTouchView *wanjieTouchView;
@property (strong, nonatomic) IBOutlet BungumiCaterotyTouchView *guochanTouchView;
@property (strong, nonatomic) IBOutlet BungumiCaterotyTouchView *guanfangTouchView;

@property (strong, nonatomic) IBOutlet UIButton *pursueButton;
@property (strong, nonatomic) IBOutlet UIButton *timelineButton;
@property (strong, nonatomic) IBOutlet UIButton *categoryButton;
// 重写TouchBegin
@property (strong, nonatomic) IBOutlet UIView *downView;

@end


@implementation BungumiHeaderView


- (void)awakeFromNib {
    [super awakeFromNib];
    // 循环滚动视图
    [self.topView addSubview:self.agCSV];
    
    // 重新给TouchView赋值
    self.lianzaiTouchView.imageView.image = [UIImage imageNamed:@"bungumi_unfinished"];
    self.lianzaiTouchView.titleLabel.text = @"连载动画";
    self.wanjieTouchView.imageView.image = [UIImage imageNamed:@"bungumi_finished"];
    self.wanjieTouchView.titleLabel.text = @"完结动画";
    self.guochanTouchView.imageView.image = [UIImage imageNamed:@"bungumi_domestic"];
    self.guochanTouchView.titleLabel.text = @"国产动画";
    self.guanfangTouchView.imageView.image = [UIImage imageNamed:@"bungumi_official"];
    self.guanfangTouchView.titleLabel.text = @"官方延展";
    //
    _pursueButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
    _timelineButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
    _categoryButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
    //
    self.downView.backgroundColor = RecommendGrayColor;
}


- (AGCircularScrollView *)agCSV {
    if (_agCSV == nil) {
        self.agCSV = [[AGCircularScrollView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenWidth * 22 / 75.0)];;
    }
    return _agCSV;
}

- (void)setImageMapKey:(NSString *)imageMapKey {
    if (_imageMapKey != imageMapKey) {
        _imageMapKey = imageMapKey;
        [self.agCSV registerImageMapKey:imageMapKey];
    }
}

- (void)setCircleViewModelArray:(NSArray *)circleViewModelArray {
    if ( _circleViewModelArray != circleViewModelArray) {
        _circleViewModelArray = circleViewModelArray;
        self.agCSV.bannerImageModel = circleViewModelArray;
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
