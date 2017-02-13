//
//  BBSViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 17/2/8.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import "BBSViewController.h"
#import "AGRefreshCollectionView.h"
#import "BBSCollectionViewCell.h"

#define kCellHeight 50
#define CellIdentifier @"bbsCell"
#define FooterIdentifier @"footer"


@interface BBSViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) AGRefreshCollectionView *collectionView;

@property (nonatomic, strong) NSArray *cellImageNameArray;
@property (nonatomic, strong) NSArray *cellTitleArray;

@end

@implementation BBSViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.cellTitleArray = @[@[@"兴趣圈", @"话题中心", @"活动中心"],
                                @[@"原创排行榜", @"全区排行榜"],
                                @[@"游戏中心", @"周边商城"]];
        self.cellImageNameArray = @[@[@"discovery_circle_ico", @"discovery_topicCenter", @"home_recommend_activity"],
                                    @[@"discovery_rankOriginal_ico", @"discovery_rankAll_ico"],
                                    @[@"discovery_game_ico", @"discovery_shop_ico"]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = SAKURACOLOR;
    // Do any additional setup after loading the view.
    [self setupSubViews];
}

- (void)setupSubViews {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(screenWidth, kCellHeight);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.footerReferenceSize = CGSizeMake(screenWidth, 10);
    
    self.collectionView = [[AGRefreshCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = SAKURACOLOR;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    [_collectionView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    // registerCell
    [_collectionView registerClass:[BBSCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterIdentifier];
    
}

#pragma mark- title | image OfIndexPath

- (NSInteger)countOfSection {
    return self.cellTitleArray.count;
}

- (NSInteger)countOfItemInSection:(NSInteger)section {
    return ((NSArray *)(self.cellTitleArray[section])).count;
}

- (NSString *)titleOfIndexPath:(NSIndexPath *)indexPath {
    return self.cellTitleArray[indexPath.section][indexPath.item];
}

- (NSString *)imageNameOfIndexPath:(NSIndexPath *)indexPath {
    return self.cellImageNameArray[indexPath.section][indexPath.item];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self countOfSection];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self countOfItemInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BBSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    if (indexPath.section == 0 && indexPath.item == 0) {
        cell.isShowCornerRadius = YES;
    } else {
        cell.isShowCornerRadius = NO;
    }
    cell.tagImageView.image = [UIImage imageNamed:[self imageNameOfIndexPath:indexPath]];
    cell.titleLabel.text = [self titleOfIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *footer = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterIdentifier forIndexPath:indexPath];
        footer.backgroundColor = RecommendGrayColor;
    }
    return footer;
}

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
