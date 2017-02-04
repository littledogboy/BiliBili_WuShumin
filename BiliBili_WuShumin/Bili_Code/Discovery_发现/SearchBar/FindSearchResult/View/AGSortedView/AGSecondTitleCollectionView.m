//
//  AGSecondTitleCollectionView.m
//  AGSortedView
//
//  Created by 吴书敏 on 17/2/1.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import "AGSecondTitleCollectionView.h"
#import "AGSecondTitleCollectionViewCell.h"
#define kPerRowHeight 40
#define kCellIdentifier @"secondTitle"

@interface AGSecondTitleCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end


@implementation AGSecondTitleCollectionView

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)array {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsZero;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        _titleArray = array;
        self.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1.0];
        self.delegate = self;
        self.dataSource = self;
        self.isFirstSread = YES; // 第一次展开
        
        // regist cell
        [self registerClass:[AGSecondTitleCollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
    }
    return self;
}

// second class Title setter
- (void)setTitleArray:(NSArray<NSString *> *)titleArray {
    _titleArray = titleArray;
    [self reloadData];
}

#pragma mark- titleOfIndexPath

- (NSString *)titleOfIndexPath:(NSIndexPath *)indexPath {
    return _titleArray[indexPath.row];
}

#pragma mark-
#pragma mark collectionDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _titleArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AGSecondTitleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    [cell.button setTitle:[self titleOfIndexPath:indexPath] forState:(UIControlStateNormal)];
    if (indexPath.row == _selectedIndex) {
        cell.selected = YES;
    } else {
        cell.selected = NO;
    }
    cell.hidden = YES;
    return cell;
}

#pragma mark- collectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    AGSecondTitleCollectionViewCell *cell = (AGSecondTitleCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.selected = YES;
    _didSelectedCellBlock(@(indexPath.item)); // 选中下标
    
    // 取消非选中 cell 效果
    if (indexPath.row != _selectedIndex) {
        AGSecondTitleCollectionViewCell *cell = (AGSecondTitleCollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:_selectedIndex inSection:0]];
        cell.selected = NO;
        _selectedIndex = indexPath.row;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    AGSecondTitleCollectionViewCell *cell = (AGSecondTitleCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.selected = NO;
}



#pragma mark- collectionViewFlowLayoutDelegate 

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger perRowCout = _titleArray.count >= 5 ? 5 : _titleArray.count;
    CGFloat height = kPerRowHeight;
    CGFloat width = ([UIScreen mainScreen].bounds.size.width) / perRowCout;
    CGSize itemSize = CGSizeMake(width, height);
    return itemSize;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
