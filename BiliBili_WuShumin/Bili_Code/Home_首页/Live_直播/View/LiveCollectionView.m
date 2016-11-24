//
//  LiveCollectionView.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/27.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "LiveCollectionView.h"
#import "LiveRecommendData.h"

#import "LiveHeaderView.h"
#import "LivePartitionHeaderView.h"

#import "LiveViewCell.h"

#define kLiveHeaderView @"LiveHeaderView"
#define kLivePartitionHeaderView @"LivePartitionHeaderView"
#define kLiveViewCell @"LiveViewCell"

@interface LiveCollectionView () <UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,  UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray<LivePartition *> *livePartitionList;

@end

@implementation LiveCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 8;
    flowLayout.sectionInset = UIEdgeInsetsMake(12, 12, 12, 12);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //
    CGFloat itemWidth = (screenWidth - 3 * 12) / 2.0;
    CGFloat itemHeight = itemWidth * 143 / 169.5 + 12;
    flowLayout.itemSize = CGSizeMake(itemWidth, itemHeight);
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        self.collectionViewLayout = flowLayout;
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = SAKURACOLOR;
        
        // register header
        [self registerNib:[UINib nibWithNibName:@"LiveHeaderView" bundle:[NSBundle mainBundle]]
forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
      withReuseIdentifier:kLiveHeaderView];

        [self registerNib:[UINib nibWithNibName:@"LivePartitionHeaderView" bundle:[NSBundle mainBundle]]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
      withReuseIdentifier:kLivePartitionHeaderView];
        
        // register cell
        [self registerNib:[UINib nibWithNibName:@"LiveViewCell" bundle:[NSBundle mainBundle]]
forCellWithReuseIdentifier:kLiveViewCell];
    }
    return self;
}


// 重写reloadData ， 重新组合数据
- (void)reloadData {
    // 重新组合数据
    [self collectData];
    [super reloadData];
}

- (void)collectData {
    self.livePartitionList = [NSMutableArray array];
    // index 0 对应推荐live
    NSMutableArray *recommendLives = [self.liveRecommendData.recommendData.lives mutableCopy];
    Live *liveBanner = self.liveRecommendData.recommendData.bannerData[0];
    // 插入到中间
    [recommendLives insertObject:liveBanner atIndex:recommendLives.count / 2];
    LivePartition_Partition *recommendPartition = self.liveRecommendData.recommendData.partition;
    
    // livePartitionList <LivePartition *>
    for (int i = 0; i < self.partionArray.count + 1; i++) {
        if (i == 0) {
            LivePartition *livePartition = [[LivePartition alloc] init];
            livePartition.lives = recommendLives;
            livePartition.partition = recommendPartition;
            [self.livePartitionList addObject:livePartition];
        } else {
            [self.livePartitionList addObject:self.partionArray[i - 1]];
        }
    }
}

#pragma mark- 获取分区数、元素个数、Model

- (NSInteger)countOfItemsInSection:(NSInteger)section {
    LivePartition *livePartition = self.livePartitionList[section];
    return livePartition.lives.count;
}

- (LivePartition *)livePartitionOfIndexPath:(NSIndexPath *)indexPath {
    return self.livePartitionList[indexPath.section];
}

- (LivePartition_Partition *)livePartition_PartitionOfIndexPath:(NSIndexPath *)indexPath {
    return [self livePartitionOfIndexPath:indexPath].partition;
}

- (Live *)liveOfIndexPath:(NSIndexPath *)indexPath {
    return [self livePartitionOfIndexPath:indexPath].lives[indexPath.item];
}


#pragma mark- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.livePartitionList.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self countOfItemsInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = nil;
    LiveViewCell *liveViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:kLiveViewCell forIndexPath:indexPath];
    liveViewCell.live = [self liveOfIndexPath:indexPath];
    if (indexPath.section == 0) {
        liveViewCell.isHiddrenAreaButton = NO;
    } else {
        liveViewCell.isHiddrenAreaButton = YES;
    }
    cell = liveViewCell;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        if (indexPath.section == 0) {
            LiveHeaderView *liveHeaderView = [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kLiveHeaderView forIndexPath:indexPath];
            liveHeaderView.imageMapKey = @"img";
            liveHeaderView.circleViewModelArray = self.bannerArray;
            liveHeaderView.partition = self.liveRecommendData.recommendData.partition;
            reusableView = liveHeaderView;
        } else {
            LivePartition_Partition *livePP = [self livePartition_PartitionOfIndexPath:indexPath];
            LivePartitionHeaderView *partitionHeaderView = [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kLivePartitionHeaderView forIndexPath:indexPath];
            partitionHeaderView.partition = livePP;
            reusableView = partitionHeaderView;
        }
    }
    
    return reusableView;
}


#pragma mark- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.item == [self countOfItemsInSection:indexPath.section] / 2) {
        return [LiveViewCell sizeOfLiveViewBannerCell];
    } else {
        return [LiveViewCell sizeOfLiveViewCell];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return [LiveHeaderView sizeOfLiveHeaderView];
    } else {
        return [LivePartitionHeaderView sizeOfPartitionHeaderView];
    }
    
    return CGSizeZero;
}


#pragma mark- UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.handleDidSelectedItem([self liveOfIndexPath:indexPath]);
}




@end
