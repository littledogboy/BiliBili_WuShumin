//
//  BungumiCaterotyTouchView.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/14.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "BungumiCaterotyTouchView.h"
#import "Masonry.h"

@interface BungumiCaterotyTouchView ()

@property (strong, nonatomic) IBOutlet UIView *contentView;


@end

@implementation BungumiCaterotyTouchView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = RecommendGrayColor;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.contentView = [[[NSBundle mainBundle] loadNibNamed:@"BungumiCaterotyTouchView" owner:self options:nil] lastObject];
        [self addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

@end
