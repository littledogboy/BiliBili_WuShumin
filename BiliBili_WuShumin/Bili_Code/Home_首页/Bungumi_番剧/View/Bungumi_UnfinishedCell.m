//
//  Bungumi_UnfinishedCell.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/15.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "Bungumi_UnfinishedCell.h"
#import "BungumiSerializing.h"
#import "UIImageView+WebCache.h"

@implementation Bungumi_UnfinishedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSerializing:(BungumiSerializing *)serializing {
    if (_serializing != serializing) {
        _serializing = serializing;
        // 给值
        [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:serializing.cover]];
        self.lookCountLabel.text = [NSString stringWithFormat:@"%@人在看", [NSString stringOfCount:serializing.watchingCount]];
        self.titleLabel.text = serializing.title;
        self.updateCountLabel.text = [NSString stringWithFormat:@"更新至第%@话", serializing.newestEpIndex];
        
    }
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    CGFloat itemWidth = (screenWidth - 2 * 12 - 2 * 8) / 3.0;
    CGFloat itemHeight = 205;
    CGSize size = CGSizeMake(itemWidth, itemHeight);
    CGRect newFrame = layoutAttributes.frame;
    newFrame.size.height = size.height;
    layoutAttributes.frame = newFrame;
    return layoutAttributes;
}





@end
