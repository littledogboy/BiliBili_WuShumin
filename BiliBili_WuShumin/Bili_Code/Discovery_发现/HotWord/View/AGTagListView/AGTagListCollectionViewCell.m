//
//  AGTagListCollectionViewCell.m
//  AGTagListView
//
//  Created by 吴书敏 on 17/2/5.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import "AGTagListCollectionViewCell.h"

@implementation AGTagListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    self.titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:13.0f];
    [self.contentView addSubview:_titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = self.bounds;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.titleLabel.text = @"";
}



@end
