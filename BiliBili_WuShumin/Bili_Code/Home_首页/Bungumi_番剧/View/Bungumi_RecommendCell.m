//
//  Bungumi_RecommendCell.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/16.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "Bungumi_RecommendCell.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"

@interface Bungumi_RecommendCell ()

@end

@implementation Bungumi_RecommendCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    // 注意： 一定要 禁用 file's owner 的 autoLayout
    WS(ws);
    [self.contentView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@(0));
        make.width.equalTo(@(screenWidth - 12 * 2)); // 这里必须给定width的值
        make.bottom.equalTo(ws.descLabel.bottom).offset(10); // content.bottom = ws.desLabel.bottom + 10
    }];
    
    [self.coverImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.equalTo(ws.contentView);
        make.height.equalTo(ws.coverImageView.width).multipliedBy(110/351.0);
    }];
    
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.coverImageView).offset(10);
        make.top.equalTo(ws.coverImageView.bottom).offset(10);
        make.width.equalTo(ws.coverImageView);
        make.height.equalTo(@(17));
    }];
    
    [self.descLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.titleLabel);
        make.top.equalTo(ws.titleLabel.bottom).offset(10);
        make.width.equalTo(ws.titleLabel);
        make.height.greaterThanOrEqualTo(@(14)).priority(1000); // 这里给1000 优先级
    }];
     
}

- (void)setRecommend:(BungumiRecommend *)recommend {
    if (_recommend != recommend) {
        _recommend = recommend;
        [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:recommend.cover]];
        self.isNewImageView.hidden = recommend.isNew;
        self.titleLabel.text = recommend.title;
        self.descLabel.text = recommend.desc;
    }
}


// 重写优先约束属性
- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size];
    CGRect newFrame = layoutAttributes.frame;
    newFrame.size.height = size.height;
    newFrame.size.width = screenWidth - 12 * 2; // 不同屏幕适配
    layoutAttributes.frame = newFrame;
    return layoutAttributes;

}

@end
