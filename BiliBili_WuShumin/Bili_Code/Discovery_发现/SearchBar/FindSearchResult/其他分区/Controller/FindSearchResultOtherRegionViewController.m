//
//  FindSearchResultOtherRegionViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/26.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "FindSearchResultOtherRegionViewController.h"
#import "FindSearchResultOtherRegionModel.h"

#import "FindResultSeasonCollectionViewCell.h"
#import "FindResultUPCollectionViewCell.h"
#import "FindResultMovieCollectionViewCell.h"
#define CellIdentifierSeason @"season"
#define CellIdentifierUP @"up"
#define CellIdentifierMovie @"movie"

@interface FindSearchResultOtherRegionViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) FindSearchResultOtherRegionModel *regionModel;
@property (nonatomic, strong) UICollectionView *regionCollectionView;

@end

@implementation FindSearchResultOtherRegionViewController

- (instancetype)initWithType:(NSInteger)type keyword:(NSString *)keyword {
    self = [super init];
    if (self) {
        self.regionModel = [[FindSearchResultOtherRegionModel alloc] init];
        _regionModel.keyword = keyword;
        _regionModel.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubViews];
    // 网络请求
    [self.regionModel getSearchResultWithSuccess:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.regionCollectionView reloadData];
        });
    } failure:^(NSString *errorMsg) {
        NSLog(@"%@", errorMsg);
    }];
}

- (void)setupSubViews {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(12, 12, 12, 12);
    flowLayout.itemSize = CGSizeMake(screenWidth - 12 * 2, 70);
    flowLayout.minimumLineSpacing = 15;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.regionCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _regionCollectionView.backgroundColor = RecommendGrayColor;
    _regionCollectionView.delegate = self;
    _regionCollectionView.dataSource = self;
    [self.view addSubview:_regionCollectionView];
    // register
    [self.regionCollectionView registerClass:[FindResultSeasonCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifierSeason];
    [self.regionCollectionView  registerClass:[FindResultUPCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifierUP];
    [self.regionCollectionView registerClass:[FindResultMovieCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifierMovie];
    // layout
    [_regionCollectionView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark- collectonnViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.regionModel.searchResultArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = nil;
    id cellModel = self.regionModel.searchResultArray[indexPath.row];
    switch (self.regionModel.type) {
        case 1:
        {
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifierSeason forIndexPath:indexPath];
            ((FindResultSeasonCollectionViewCell *)cell).season = cellModel;
        }
            break;
            
        case 2:
        {
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifierUP forIndexPath:indexPath];
            ((FindResultUPCollectionViewCell *)cell).up = cellModel;
        }
            break;
            
        case 3:
        {
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifierMovie forIndexPath:indexPath];
            ((FindResultMovieCollectionViewCell *)cell).movie = cellModel;
        }
            break;
            
        default:
            break;
    }
    return cell;
}

#pragma mark- delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (self.regionModel.type) {
        case 1:
            return CGSizeMake(screenWidth - 2 * 12, [FindResultSeasonCollectionViewCell cellHeight]);
            break;
            
        case 2:
            return CGSizeMake(screenWidth - 2 * 12, [FindResultUPCollectionViewCell cellHeight]);
            break;
            
        case 3:
            return CGSizeMake(screenWidth - 2 * 12, [FindResultMovieCollectionViewCell cellHeight]);
            break;
            
        default:
            break;
    }
    
    return CGSizeZero;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
