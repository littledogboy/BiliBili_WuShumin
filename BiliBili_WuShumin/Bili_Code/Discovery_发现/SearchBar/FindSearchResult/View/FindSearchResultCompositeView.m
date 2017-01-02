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

@interface FindSearchResultCompositeView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) FindItem *items;
@property (nonatomic, strong) NSArray<FindNav *> *nav;
@property (nonatomic, strong) NSMutableDictionary *itemsDic;
@property (nonatomic, strong) NSMutableArray<NSArray *> *itemsArray;

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
        [self registerClass:[FindResultSeasonCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifierSeason];
        [self registerClass:[FindResultMovieCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifierMovie];
        [self registerClass:[FindSearchResultCompositeCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifierArchive];
        
    }
    return self;
}

- (void)setResultModel:(FindSearchResultModel *)resultModel {
        _resultModel = resultModel;
        self.items = resultModel.resultData.items;
        self.nav = resultModel.resultData.nav;
        //
        self.itemsDic = [NSMutableDictionary dictionary];
        self.itemsArray = [NSMutableArray array];
        if (self.items.season.count) {
            [_itemsDic setObject:_items.season forKey:@"season"];
            [_itemsArray addObject:_items.season];
        } else if (self.items.movie.count) {
            [_itemsDic setObject:_items.movie forKey:@"movie"];
            [_itemsArray addObject:_items.movie];
        } else if (self.items.archive.count) {
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

// 区尾
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//    
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
