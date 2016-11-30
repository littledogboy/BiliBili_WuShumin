//
//  CategoryIndexViewCell.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/11/30.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "CategoryIndexViewCell.h"
#import "RegionIconView.h"
#import "CategoryIndexModel.h"

@interface CategoryIndexViewCell ()

@property (nonatomic, strong) RegionIconView *regionIconView;

@end


@implementation CategoryIndexViewCell

+ (CategoryIndexViewCell *)dequeueWithCollectionView:(UICollectionView *)collectionView withIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //
        self.regionIconView = [[RegionIconView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_regionIconView];
        WS(ws);
        [_regionIconView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(ws.contentView);
        }];
    }
    return self;
}

- (void)setCategory:(CategoryIndexModel *)category {
    if (_category != category) {
        _category = category;
        self.regionIconView.iconImageView.image = [UIImage imageNamed:category.iconImageName];
        self.regionIconView.iconNameLabel.text = category.iconName;
        if ([category.iconName isEqualToString:@"游戏中心"]) {
            [self.regionIconView.iconImageView remakeConstraints:^(MASConstraintMaker *make) {
                make.top.left.equalTo(@(0));
                make.width.equalTo(@(76));
                make.height.equalTo(@(68));
            }];
        }
    }
}





@end
