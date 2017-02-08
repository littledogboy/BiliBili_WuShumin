//
//  AGTagListCollectionViewFlowLayout.m
//  AGTagListView
//
//  Created by 吴书敏 on 17/2/5.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import "AGTagListCollectionViewFlowLayout.h"

@interface AGTagListCollectionViewFlowLayout ()

@property (nonatomic, strong) NSMutableArray *itemAttributs;
@property (nonatomic, assign) CGFloat contentHeight;
@property (nonatomic, weak) id<UICollectionViewDelegateFlowLayout> delegate; // 代理，计算每个 cell 的宽度。

@end

@implementation AGTagListCollectionViewFlowLayout

//- (instancetype)init {
//    self = [super init];
//    if (self) {
//    }
//    return self;
//}

#pragma mark- 1. prepareLayout

- (void)prepareLayout {
    [super prepareLayout];
    _itemAttributs = [NSMutableArray array];
    //
    self.contentHeight = self.sectionInset.top + self.sectionInset.bottom + self.itemSize.height;
    CGFloat originX = self.sectionInset.left;
    CGFloat originY = self.sectionInset.top;
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    
    // 给每个 cell 的 attributes 赋值
    for (int i = 0 ; i < itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        CGSize size = [self itemSizeForIndexPath:indexPath];
        // 判断 originX
        if (originX + size.width + self.sectionInset.right > self.collectionView.frame.size.width) {
            originX = self.sectionInset.left;
            originY += self.minimumLineSpacing + size.height;
            self.contentHeight += self.minimumLineSpacing + size.height;
        }
        
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.frame = CGRectMake(originX, originY, size.width, size.height);
        [self.itemAttributs addObject:attributes];
        
        originX += self.minimumInteritemSpacing + size.width;
    }
}

#pragma mark- 2. collectionContentSize

- (CGSize)collectionViewContentSize {
    return CGSizeMake(self.collectionView.frame.size.width, self.contentHeight);
}

#pragma mark- 3. layoutAttrituesLayoutInrect

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.itemAttributs;
}

#pragma mark- 4. invalidate

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    CGRect oldBounds = self.collectionView.bounds;
    if (CGRectGetWidth(oldBounds) != CGRectGetWidth(newBounds)) {
        return YES;
    }
    return NO;
}



#pragma mark- delegate 获取 size
- (id<UICollectionViewDelegateFlowLayout>)delegate {
    if (!_delegate) {
        _delegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
    }
    return _delegate;
}

- (CGSize )itemSizeForIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)]) {
        self.itemSize = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    }
    return self.itemSize;
}

@end
