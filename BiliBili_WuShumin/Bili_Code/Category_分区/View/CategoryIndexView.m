//
//  CategoryIndexView.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/11/2.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "CategoryIndexView.h"
#import "CategoryIndexViewCell.h"

#define CellIdentifier @"CategoryIndexViewCell"

@implementation CategoryIndexView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(76, 90);
    layout.sectionInset = UIEdgeInsetsMake(25, 30, 25, 30);
    layout.minimumLineSpacing = 15;
    layout.minimumInteritemSpacing = (screenWidth - 3 * layout.itemSize.width - 2 * 30) / 2;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = RGBCOLOR(244, 244, 244);
        self.delegate = self;
        self.dataSource = self;
        // register
        [self registerClass:[CategoryIndexViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    }
    return self;
}

#pragma mark- categoryWithIndexPath
- (CategoryIndexModel *)categoryWithIndexPath:(NSIndexPath *)indexPath {
    return self.categoryArray[indexPath.row];
}

#pragma mark- dataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.categoryArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CategoryIndexViewCell *cell = [CategoryIndexViewCell dequeueWithCollectionView:self withIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.category = [self categoryWithIndexPath:indexPath];
    return cell;
}

@end
