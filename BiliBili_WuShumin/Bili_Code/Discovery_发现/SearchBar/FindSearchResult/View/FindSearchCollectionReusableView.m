//
//  FindSearchCollectionReusableView.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 17/1/24.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import "FindSearchCollectionReusableView.h"

@interface FindSearchCollectionReusableView ()

@property (nonatomic, retain) UIImageView *bgImageView;

@end

@implementation FindSearchCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _titleButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _titleButton.tintColor = SAKURACOLOR;
        _titleButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_titleButton];
        [_titleButton makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        _bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_moreLine"]];
        [self.titleButton addSubview:_bgImageView];
        [_bgImageView makeConstraints:^(MASConstraintMaker *make) {
            make.center.with.equalTo(_titleButton);
            make.height.equalTo(@1.5);
        }];
    }
    return self;
}

+ (CGFloat)resuableViewHeight {
    return 24;
}


@end
