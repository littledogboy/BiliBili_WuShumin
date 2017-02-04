//
//  FindSearchResultCompositeView.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 17/1/3.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import "FindSearchResultCompositeView.h"
#import "FindSearchResultModel.h"
#import "FindArchive.h"
#import "FindSeason.h"
#import "FindMovie.h"

#import "FindSearchResultCompositeCollectionViewCell.h" // 综合
#import "FindResultSeasonCollectionViewCell.h" // 番剧
#import "FindResultMovieCollectionViewCell.h" // 影视

#define CellIdentifierSeason @"season"
#define CellIdentifierMovie @"movie"
#define CellIdentifierArchive @"archive"

#import "FindSearchCollectionReusableView.h"

#define ReuableFooterView @"more"

@interface FindSearchResultCompositeView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) FindItem *items;
@property (nonatomic, strong) NSArray<FindNav *> *nav;
@property (nonatomic, strong) NSMutableDictionary *itemsDic;
@property (nonatomic, strong) NSMutableArray<NSArray *> *itemsArray;
@property (nonatomic, strong) NSMutableDictionary *footerTitleDic;

@property (nonatomic, assign) BOOL isLoadingMore; // 是否 正 加载更多，默认为no

@end

@implementation FindSearchResultCompositeView

- (instancetype)initWithFrame:(CGRect)frame {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(12, 12, 12, 12);
    flowLayout.minimumLineSpacing = 18;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        self.backgroundColor = RecommendGrayColor;
        self.dataSource = self;
        self.delegate = self;
        // regist
        // 番剧
        [self registerClass:[FindResultSeasonCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifierSeason];
        // 电影
        [self registerClass:[FindResultMovieCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifierMovie];
        // 综合
        [self registerClass:[FindSearchResultCompositeCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifierArchive];
        
        // registResuableView
        [self registerClass:[FindSearchCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:ReuableFooterView];
    }
    return self;
}

- (void)setResultModel:(FindSearchResultModel *)resultModel {
    _resultModel = resultModel;
    self.items = resultModel.resultData.items;
    self.nav = resultModel.resultData.nav;
    
    // itemsDic @“season” ： array
    // itemsArray 元素为数组
    // footerTitleDic 区尾标题 @“season” : @"更多番剧%lu"
    self.itemsDic = [NSMutableDictionary dictionary];
    self.itemsArray = [NSMutableArray array];
    self.footerTitleDic = [NSMutableDictionary dictionary];
    
    if (self.items.season.count) { // 番剧
        [_itemsDic setObject:_items.season forKey:@"season"];
        [_itemsArray addObject:_items.season];
        if (self.nav[0].total > 3) {
            [_footerTitleDic setObject:[NSString stringWithFormat:@"更多番剧（%lu）", self.nav[0].total] forKey:@"season"];
        }
    }
    
    if (self.items.movie.count) { // 影视
        [_itemsDic setObject:_items.movie forKey:@"movie"];
        [_itemsArray addObject:_items.movie];
        if (self.nav[2].total > 3) {
            [_footerTitleDic setObject:[NSString stringWithFormat:@"更多影视（%lu）", self.nav[2].total] forKey:@"movie"];
        }
    }
    
    if (self.items.archive.count) { // 综合
        [_itemsDic setObject:_items.archive forKey:@"archive"];
        [_itemsArray addObject:_items.archive];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadData];
    });
    
}

#pragma mark-  分区数，分区中 items 数

- (NSInteger)countOfSection {
    return self.itemsArray.count;
}

- (NSInteger)countOfItemsInSection:(NSInteger )section {
    return self.itemsArray[section].count;
}

- (id)cellModelOfIndexPath:(NSIndexPath *)indexPath {
    return self.itemsArray[indexPath.section][indexPath.item];
}


#pragma mark-
#pragma mark DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self countOfSection];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self countOfItemsInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    id cellModel = [self cellModelOfIndexPath:indexPath];
    if ([cellModel isKindOfClass:[FindSeason class]]) {
        FindResultSeasonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifierSeason forIndexPath:indexPath];
        cell.season = cellModel;
        return cell;
    } else if ([cellModel isKindOfClass:[FindMovie class]]) {
        FindResultMovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifierMovie forIndexPath:indexPath];
        cell.movie = cellModel;
        return cell;
    } else if([cellModel isKindOfClass:[FindArchive class]]) {
        FindSearchResultCompositeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifierArchive forIndexPath:indexPath];
        cell.archive = cellModel;
        return cell;
    } else {
        return nil;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    id cellModel = [self cellModelOfIndexPath:indexPath];
    if ([cellModel isKindOfClass:[FindSeason class]]) {
        return CGSizeMake(screenWidth - 2 * 12, [FindResultSeasonCollectionViewCell cellHeight]);
    } else if ([cellModel isKindOfClass:[FindMovie class]]) {
        return CGSizeMake(screenWidth - 2 * 12, [FindResultMovieCollectionViewCell cellHeight]);
    } else if([cellModel isKindOfClass:[FindArchive class]]) {
        return CGSizeMake(screenWidth - 2 * 12, [FindSearchResultCompositeCollectionViewCell cellHeight]);
    } else {
        return CGSizeMake(screenWidth - 2 * 12, 70);
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    FindSearchCollectionReusableView *footerView = nil;
    id cellModel = [self cellModelOfIndexPath:indexPath];
    if ([kind isEqualToString:UICollectionElementKindSectionFooter] && self.itemsArray.count > 1) {
        footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:ReuableFooterView forIndexPath:indexPath];
        NSString *title = nil;
        if ([cellModel isKindOfClass:[FindSeason class]]) {
            title = [self.footerTitleDic objectForKey:@"season"];
        } else if ([cellModel isKindOfClass:[FindMovie class]]) {
            title = [self.footerTitleDic objectForKey:@"movie"];
        }
        [footerView.titleButton setTitle:title forState:(UIControlStateNormal)];
    }
    
    return footerView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    BOOL isShowFooter = NO;
    id cellModel = [self cellModelOfIndexPath:[NSIndexPath indexPathForItem:0 inSection:section]];
    if ([cellModel isKindOfClass:[FindSeason class]]) {
        if (self.nav[0].total > 3) {
            isShowFooter = YES;
        }
    }
    
    if ([cellModel isKindOfClass:[FindMovie class]]) {
        if (self.nav[2].total > 3) {
            isShowFooter = YES;
        }
    }
    
    if (self.itemsArray.count > 1 && isShowFooter) {
        return CGSizeMake(screenWidth, [FindSearchCollectionReusableView resuableViewHeight]);
    } else {
        return CGSizeZero;
    }
}

#pragma mark- 上拉刷新

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height && _isLoadingMore == NO) {
        _isLoadingMore = YES; // 加载时 至为yes
        [self.resultModel getMoreSearchResultEntityWithSuccess:^{
            [self reloadData];
            _isLoadingMore = NO; // 加载完成后至为 no
        } failure:^(NSString *errorMsg) {
            NSLog(@"%@", errorMsg);
        }];
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
