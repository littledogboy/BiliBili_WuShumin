//
//  Bungumi_PreviousCell.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/16.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "Bungumi_PreviousCell.h"
#import "UIImageView+WebCache.h"
#import "BungumiList.h"

@implementation Bungumi_PreviousCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)setList:(BungumiList *)list {
    if (_list != list) {
        _list = list;
        [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:list.cover]];
        self.lookCountLabel.text = [NSString stringWithFormat:@"%@人追番", [NSString stringOfCount:[list.favourites integerValue]]];
        self.titleLabel.text = list.title;
    }
}

+ (CGSize )sizeOfBungumi_PreviousCell {
    CGFloat width = (screenWidth - 12 * 2 - 8 * 2) / 3.0;
    CGFloat height = 190;
    return CGSizeMake(width, height);
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    //    if (!_isHeightCalculated) {
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size];
    CGRect newFrame = layoutAttributes.frame;
    newFrame.size.height = size.height;
    layoutAttributes.frame = newFrame;
    //        _isHeightCalculated = true;
    //    }
    return layoutAttributes;
}

@end
