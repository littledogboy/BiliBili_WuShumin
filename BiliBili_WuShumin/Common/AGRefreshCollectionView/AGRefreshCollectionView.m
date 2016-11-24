//
//  AGRefreshCollectionView.m
//  检测CollectionView的ContentView
//
//  Created by 吴书敏 on 16/11/2.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "AGRefreshCollectionView.h"
#import "UIView+CornerRadius.h"

#define RGBCOLOR(r, g, b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0f]
#define SAKURACOLOR RGBCOLOR(250, 114, 152)
#define GrayColor RGBCOLOR(244, 244, 244)

#define LineSpacing 0 // 上下间距为 0
#define RowSpacing 12 // 左右间距为 12


@interface AGRefreshCollectionView () 

@end

@implementation AGRefreshCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(12, 12, 12, 12);;
    CGFloat itemWidth = (screenWidth - 3 * 12) / 2.0;
    CGFloat itemHeight = itemWidth * 143 / 169.5 + 12;
    flowLayout.itemSize = CGSizeMake(itemWidth, itemHeight);
    flowLayout.minimumLineSpacing = LineSpacing;
    flowLayout.minimumInteritemSpacing = RowSpacing;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;

    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        self.alwaysBounceVertical = YES;
        self.backgroundColor = SAKURACOLOR;
        self.layer.cornerRadius = 8.0;
        self.layer.masksToBounds = YES;
        
        self.backgroundView = [[UIView alloc] init];
        self.backgroundView.backgroundColor = GrayColor;
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.alwaysBounceVertical = YES;
        self.backgroundColor = SAKURACOLOR;
        self.layer.cornerRadius = 8.0;
        self.layer.masksToBounds = YES;
        
        self.backgroundView = [[UIView alloc] init];
        self.backgroundView.backgroundColor = GrayColor;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect rect = self.backgroundView.frame;
    // backgroundViw 默认为 nil。充满整个collectionView。 如果想要固定，只需要给个确定值即可，固定在一个位置，否则，一直以collectionView.top为基准。
    // 系统做的是 background.y = self.contentOffset.y
    if (self.contentOffset.y < 0) { // 偏移的时候，必须更改 y 值，固定一个地方，否则会充满 collectionView
        self.backgroundView.frame = CGRectMake(rect.origin.x, 0, rect.size.width, rect.size.height);
    }
}

@end
