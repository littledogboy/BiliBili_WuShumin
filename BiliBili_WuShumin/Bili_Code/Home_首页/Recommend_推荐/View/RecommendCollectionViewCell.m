//
//  RecommendCollectionViewCell.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/8/26.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "RecommendCollectionViewCell.h"
#import "Body.h"
#import "UIImageView+WebCache.h"
#import "NSString+AGAdd.h"

@implementation RecommendCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.coverImageView.layer.borderWidth = 0.5f;
    self.coverImageView.layer.borderColor = [UIColor grayColor].CGColor;
    self.coverImageView.layer.cornerRadius = 5.0f;
    self.coverImageView.layer.masksToBounds =  YES;
    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping; // 以单词切割
    self.midView.backgroundColor = [UIColor clearColor];
    // 设置渐变层
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_history_item_graual_hd"]];
    bgImageView.frame = _midView.bounds;
    [self.midView insertSubview:bgImageView atIndex:0];
}

- (void)setBody:(Body *)body {
    if (body != nil) {
        _body = body;
        // 替换网络图片
        WS(ws);
        [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:body.cover]
                               placeholderImage:[UIImage imageNamed:@"cell_Default"]
                                      completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                          ws.coverImageView.contentMode = UIViewContentModeScaleAspectFit;
                                      }];
        self.titleLabel.text = body.title;
        self.playCountLabel.text = [NSString stringOfCount:body.play];
        self.danmukuCountLabel.text = [NSString stringOfCount:body.danmaku];
        }
}



@end
