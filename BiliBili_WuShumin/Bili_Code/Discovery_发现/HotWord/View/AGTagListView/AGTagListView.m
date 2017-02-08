//
//  AGTagListView.m
//  AGTagListView
//
//  Created by 吴书敏 on 17/2/5.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import "AGTagListView.h"
#import "AGTagListCollectionViewFlowLayout.h"
#import "AGTagListCollectionViewCell.h"

#define CellIdentifier @"tagListCell"

@interface AGTagListView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


@end

@implementation AGTagListView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    AGTagListCollectionViewFlowLayout *flowLayout = [[AGTagListCollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(12, 12, 12, 12);
    flowLayout.minimumLineSpacing = 10; // 行距
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.itemSize = CGSizeMake(33, 33.0);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor clearColor];
    [self addSubview:_collectionView];;
    
    // register cell
    [_collectionView registerClass:[AGTagListCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}

- (void)setTagsArray:(NSMutableArray *)tagsArray {
    _tagsArray = tagsArray;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
}

#pragma mark- datasource | flowLayoutDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _tagsArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    AGTagListCollectionViewFlowLayout *flowLayout = (AGTagListCollectionViewFlowLayout *)collectionViewLayout;
    CGSize maxSize = CGSizeMake(_collectionView.frame.size.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right, flowLayout.itemSize.height);
    NSString *title = self.tagsArray[indexPath.item];
    CGRect boundRect = [title boundingRectWithSize:maxSize options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]} context:nil];
    return CGSizeMake(boundRect.size.width + 20, flowLayout.itemSize.height);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AGTagListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.titleLabel.text = _tagsArray[indexPath.item];
    cell.titleLabel.textColor = self.titleColor;
    cell.backgroundColor = self.tagBgColor;
    cell.layer.cornerRadius = self.cornerRadius;
    cell.layer.masksToBounds = YES;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.tagDidSelectedBlock) {
        _tagDidSelectedBlock(self.tagsArray[indexPath.item]);
    }
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
