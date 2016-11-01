//
//  LiveViewCell.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/31.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "LiveViewCell.h"
#import "UIImageView+WebCache.h"
#import "Live.h"

@interface LiveViewCell ()

@property (strong, nonatomic) IBOutlet UIImageView *coverImageView;
@property (strong, nonatomic) IBOutlet UILabel *ownerNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *onLineCountLabel;

@property (strong, nonatomic) IBOutlet UIButton *areaButton;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end


@implementation LiveViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (CGSize )sizeOfLiveViewCell {
    CGFloat itemWidth = (screenWidth - 3 * 12) / 2.0;
    CGFloat itemHeight = itemWidth * 143 / 169.5 + 12;
    return CGSizeMake(itemWidth, itemHeight);
}

+ (CGSize)sizeOfLiveViewBannerCell {
    CGFloat itemWidth = screenWidth - 2 * 12;
    CGFloat itemHeight = itemWidth * 160 / 351;
    return CGSizeMake(itemWidth, itemHeight);
}

- (NSString *)spaceStringOfNumber:(NSInteger )number {
    NSString *spaceString = @"";
    for (int i = 0; i < number; i++) {
        spaceString = [spaceString stringByAppendingString:@" "];
    };
    return spaceString;
}

- (void)setIsHiddrenAreaButton:(BOOL)isHiddrenAreaButton {
    _isHiddrenAreaButton = isHiddrenAreaButton;
    self.areaButton.hidden = isHiddrenAreaButton;
    if (isHiddrenAreaButton == NO) {
        NSString *spaceString = [self spaceStringOfNumber:20];
        self.titleLabel.text = [spaceString stringByAppendingString:_live.title];
    } else {
        self.titleLabel.text = _live.title;
    }
}

- (void)setLive:(Live *)live {
    if (_live != live) {
        _live = live;
        
        //
        [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:live.cover.src]];
        self.ownerNameLabel.text = live.owner.name;
        self.onLineCountLabel.text = [NSString stringOfCount:live.online];
        [self.areaButton setTitle:[NSString stringWithFormat:@"#%@#", live.area] forState:UIControlStateNormal];
        [self.areaButton addTarget:self action:@selector(turnToLiveArea:) forControlEvents:(UIControlEventTouchUpInside)];
        self.titleLabel.text = live.title;
    }
}

- (void)turnToLiveArea:(UIButton *)button {
    // 判断area，跳转。
    NSLog(@"%@", self.live.area);
}


@end
