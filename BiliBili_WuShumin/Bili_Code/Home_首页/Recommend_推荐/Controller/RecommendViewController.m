//
//  RecommendViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/8/25.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "RecommendViewController.h"
#import "Recommend.h"
#import "BiliBiliAPI.h"
#import "AFNetworking.h"
#import "Recommend_RecommendHeaderView.h"
#import "RecommendCollectionViewCell.h"
#import "Recommend_RefreshCollectionViewCell.h"
#import "AGHTTPURLHandle.h"


#define CollectionEdgeInsets UIEdgeInsetsMake(12, 12, 0, 12)
#define LineSpacing 0 // 上下间距为 0
#define RowSpacing 12 // 左右间距为 12

#define r_recommendHeaderViewIdentifier @"r_recommendHeaderView"
#define r_recommendCellIdentifier @"r_recommendCell"
#define r_refreshCellIdentifier @"r_refreshCell"


@interface RecommendViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

// model
@property (nonatomic, strong) Recommend *recommend;
@property (nonatomic, strong) NSMutableArray<Data *> *dataArray;
@property (nonatomic, strong) NSMutableArray *refreshURLStringArray;

// view
@property (nonatomic, strong) UICollectionView *recommendCollectionView;

@property (nonatomic, strong) Recommend_RefreshCollectionViewCell *refreshCell;

@end

@implementation RecommendViewController

#pragma mark-
#pragma mark 加载网络数据
- (void)reloadData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:Home_RecommendURLString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:(NSJSONReadingMutableContainers) error:nil];
        self.recommend = [[Recommend alloc] initWithDictionary:dic];
        self.dataArray = [[_recommend data] mutableCopy];
        for (Data *data in [_recommend data]) {
            if ([data.title isEqualToString:@"活动中心"]) {
                [_dataArray removeObject:data];
            }
        }
        // 进入主线程刷新数据
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.recommendCollectionView reloadData];
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

#pragma mark- 刷新分区数据

- (void)refreshIndexPath:(NSIndexPath *)indexPath body:(id )responseObject {
    NSInteger section = indexPath.section;
    
    if (responseObject) {
        // 1. 获取到网络请求的数据
        NSMutableArray *bodyArray = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:(NSJSONReadingMutableContainers) error:nil];
        // 根据section 判断 网络数据 类型
        NSArray *data = nil;
        if (section == 0) {
            Data *sectionData = self.dataArray[section];
            data = dic[@"data"];
            for (NSDictionary *bodyDic in data) {
                Body *body = [[Body alloc] initWithDictionary:bodyDic];
                [bodyArray addObject:body];
            }
            // >1. 替换该分区数据
            sectionData.body = bodyArray;
            
        } else if (section == 1) { // live
            Data *sectionData = self.dataArray[section];
            data = dic[@"data"];
            // >2. 给 body 的 liveModel 赋值
            [data enumerateObjectsWithOptions:(NSEnumerationConcurrent) usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                Live *live = [[Live alloc] initWithDictionary:obj];
                sectionData.body[idx].liveModel = live;
            }];
            
        } else { // subarea
            Data *sectionData = self.dataArray[section];
            data = dic[@"list"];
            // 3. 给 body 的 listModel 赋值
            [data enumerateObjectsWithOptions:(NSEnumerationConcurrent) usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (idx <= 3) {
                    List *list = [[List alloc] initWithDictionary:obj];
                    sectionData.body[idx].listModel = list;
                }
            }];
        }
    }
    
    // 3. 更新数据 这里的刷新按钮所在的单元格，需要手动更新。
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView performWithoutAnimation:^{
            for (int i = 0; i <= indexPath.item; i++) {
                if (i < indexPath.item) {
                    // 自动给值
                    NSIndexPath *autoRefreshIndexPath = [NSIndexPath indexPathForItem:i inSection:section];
                    [self.recommendCollectionView reloadItemsAtIndexPaths:@[autoRefreshIndexPath]];
                } else {
                    // 手动给值
                    Recommend_RefreshCollectionViewCell *cell = (Recommend_RefreshCollectionViewCell *)[self.recommendCollectionView cellForItemAtIndexPath:indexPath];
                    Body *body = [self bodyOfIndexPath:indexPath];
                    cell.body = body;
                }
            }
        }];
    });
}

- (void)addCollectionView {
    // flowLayout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = CollectionEdgeInsets;
    CGFloat itemWidth = (screenWidth - 3 * 12) / 2.0;
    CGFloat itemHeight = itemWidth * 143 / 169.5 + 12;
    flowLayout.itemSize = CGSizeMake(itemWidth, itemHeight);
    flowLayout.minimumLineSpacing = LineSpacing;
    flowLayout.minimumInteritemSpacing = RowSpacing;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    // collectionView
    self.recommendCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight - 54 - 49) collectionViewLayout:flowLayout];
    _recommendCollectionView.delegate = self;
    _recommendCollectionView.dataSource = self;
    _recommendCollectionView.backgroundColor = RGBCOLOR(244, 244, 244);
    // regist header
    [_recommendCollectionView
    registerNib:[UINib nibWithNibName:NSStringFromClass([Recommend_RecommendHeaderView class])
         bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:r_recommendHeaderViewIdentifier];
    // regist cell
    [_recommendCollectionView
    registerNib:[UINib nibWithNibName:NSStringFromClass([RecommendCollectionViewCell class])
         bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:r_recommendCellIdentifier];
    //
    [_recommendCollectionView
     registerNib:[UINib nibWithNibName:NSStringFromClass([Recommend_RefreshCollectionViewCell class])
          bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:r_refreshCellIdentifier];
    [self.view addSubview:_recommendCollectionView];
}

- (void)loadRefreshURLStringArray {
    // 注意，下标为2的番剧推荐没有刷新按钮
    NSArray *urlStringArray = @[Recommend_RecommendURLString,
                                Recommend_LiveURLString,
                                [NSNull null], // 推荐番剧为空， 空对象类型
                                Recommend_BangumiURLString,
                                Recommend_MusicURLString,
                                Recommend_DanceURLString,
                                Recommend_GameURLString,
                                Recommend_GuiChuURLString,
                                Recommend_TechURLString, // 科技
                                Recommend_LifeURLString,
                                Recommend_FashionURLString,
                                Recommend_EntertainmentURLString,
                                Recommend_TVURLString,
                                Recommend_MovieString
                                ];
    self.refreshURLStringArray = [urlStringArray mutableCopy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self reloadData];
    [self addCollectionView];
    [self loadRefreshURLStringArray];
    // Do any additional setup after loading the view.
   
}


#pragma mark-
#pragma mark - 根据indexPath 获取对应数据
- (NSInteger)numberOfItemsInSection:(NSInteger)section {
    return ((Data *)self.dataArray[section]).body.count;
}

- (NSArray *)topInSection:(NSInteger)section {
    return ((Data *)self.dataArray[section]).banner.top;
}

- (NSArray *)bottomInSection:(NSInteger)section {
    return ((Data *)self.dataArray[section]).banner.bottom;
}

- (Body *)bodyOfIndexPath:(NSIndexPath *)indexPath {
    Data *data = ((Data *)self.dataArray[indexPath.section]);
    return data.body[indexPath.item];
}

- (Banner *)bannerOfIndexPath:(NSIndexPath *)indePath {
    Data *data = (Data *)self.dataArray[indePath.section];
    return data.banner;
}

#pragma mark-
#pragma mark  UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _dataArray.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self numberOfItemsInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WS(ws);
    Data *data = _dataArray[indexPath.section];
    Body *body = [self bodyOfIndexPath:indexPath];
    UICollectionViewCell *cell = nil;
    
    if (indexPath.section == 2) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:r_recommendCellIdentifier forIndexPath:indexPath];
    } else {
        if (indexPath.item == data.body.count - 1) {
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:r_refreshCellIdentifier forIndexPath:indexPath];
            ((Recommend_RefreshCollectionViewCell *)cell).refreshURLString = nil;
            ((Recommend_RefreshCollectionViewCell *)cell).refreshURLString = self.refreshURLStringArray[indexPath.section];
            // 给刷新block赋值
            ((Recommend_RefreshCollectionViewCell *)cell).refreshBlock = nil;
            ((Recommend_RefreshCollectionViewCell *)cell).refreshBlock = ^(id responseObject) {
                [ws refreshIndexPath:indexPath body:responseObject];
            };
        } else {
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:r_recommendCellIdentifier forIndexPath:indexPath];
        }
    }
    
    ((RecommendCollectionViewCell *)cell).body = body;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    Banner *banner = [self bannerOfIndexPath:indexPath];
    UICollectionReusableView *reusableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        Recommend_RecommendHeaderView *recommendHeader = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:r_recommendHeaderViewIdentifier forIndexPath:indexPath];
        recommendHeader.bannerImageModel = banner.top;
        reusableView = recommendHeader;
    }
    return reusableView;
}


#pragma mark-
#pragma mark UICollectionViewFlowDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(screenWidth, [Recommend_RecommendHeaderView heightForCollectionReusableView]);
    } else {
        return CGSizeZero;
    }
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
//    
//}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
