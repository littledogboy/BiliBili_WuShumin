//
//  BungumiViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/12.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "BungumiViewController.h"
#import "BungumiResult.h"
#import "BungumiHeaderView.h"
#import "Bungumi_UnfinishedCell.h"
#import "Bungumi_PreviousHeaderView.h"
#import "Bungumi_PreviousCell.h"

#define CollectionEdgeInsets UIEdgeInsetsMake(12, 12, 8, 12)
#define LineSpacing 12
#define InteritemSpacing 7

#define kHeaderIdentifier @"BungumiHeaderView"
#define KUnfinishedCellIdentifier @"unfinishedCell"
#define kPreviousHeaderIdentifier @"previousHeader"
#define kPreviousCell @"previousCell"

@interface BungumiViewController () <UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *bungumiCollectionView;
@property (nonatomic, strong) BungumiResult *result;
@property (nonatomic, strong) NSArray *serializingArray;
@property (nonatomic, strong) NSArray *listArray;

@end

@implementation BungumiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBungumiCollectionView];
    [self request];
    
    // Do any additional setup after loading the view.
}

#pragma mark- BungumiCollectionView

- (UINib *)nibWithClass:(Class)cls {
    return  [UINib nibWithNibName:NSStringFromClass(cls) bundle:[NSBundle mainBundle]];
}

- (void)addBungumiCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = CollectionEdgeInsets;
    CGFloat itemWidth = (screenWidth - 2 * 12 - 2 * InteritemSpacing) / 3.0;
    CGFloat itemHeight = 205;
//    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    layout.estimatedItemSize = CGSizeMake(itemWidth, itemHeight);
    layout.minimumLineSpacing = LineSpacing;
    layout.minimumInteritemSpacing = InteritemSpacing;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    // collectionView
    self.bungumiCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight - 54 - 49) collectionViewLayout:layout];
    _bungumiCollectionView.alwaysBounceVertical = YES;
    _bungumiCollectionView.delegate = self;
    _bungumiCollectionView.dataSource = self;
    _bungumiCollectionView.backgroundColor = RGBCOLOR(244, 244, 244);
    [self.view addSubview:_bungumiCollectionView];
    
    // regist cell
    [_bungumiCollectionView registerNib:[self nibWithClass:[Bungumi_UnfinishedCell class]] forCellWithReuseIdentifier:KUnfinishedCellIdentifier];
    [_bungumiCollectionView registerNib:[self nibWithClass:[Bungumi_PreviousCell class]] forCellWithReuseIdentifier:kPreviousCell];
    
    // regist header
    [_bungumiCollectionView registerNib:[self nibWithClass:[BungumiHeaderView class]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderIdentifier];
    [_bungumiCollectionView registerNib:[self nibWithClass:[Bungumi_PreviousHeaderView class]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kPreviousHeaderIdentifier];
}

#pragma mark- Request 

- (void)request {
    [AGHTTPURLHandle GET:BungumiURLString success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:(NSJSONReadingMutableContainers) error:nil];
        self.result = [[BungumiResult alloc] initWithDictionary:dic[@"result"]];
        self.serializingArray = self.result.serializing;
        self.listArray = self.result.previous.list;
        [self.bungumiCollectionView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
}

#pragma mark- IndexPath

- (NSArray *)circleViewHeads {
    return self.result.ad.head;
}

- (BungumiSerializing *)serializingOfIndexPath:(NSIndexPath *)indexPath {
    return self.serializingArray[indexPath.item];
}


- (BungumiList *)listOfIndexPath:(NSIndexPath *)indexPath {
    return self.listArray[indexPath.item];
}

#pragma mark- UICollectionViewDelegate


#pragma mark- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return _serializingArray.count;
            break;
        case 1:
            return _listArray.count;
            break;
            
        default:
            break;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = nil;
    
    switch (indexPath.section) {
        case 0:
        {
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:KUnfinishedCellIdentifier forIndexPath:indexPath];
            ((Bungumi_UnfinishedCell *)cell).serializing = [self serializingOfIndexPath:indexPath];
        }
            break;
            
        case 1:
        {
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:kPreviousCell forIndexPath:indexPath];
            ((Bungumi_PreviousCell *)cell).list = [self listOfIndexPath:indexPath];
        }
            break;
            
        default:
            break;
    }
   
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        if (indexPath.section == 0) {
            BungumiHeaderView *bungumiHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderIdentifier forIndexPath:indexPath];
            bungumiHeaderView.imageMapKey = @"img";
            bungumiHeaderView.circleViewModelArray = [self circleViewHeads];
            reusableView = bungumiHeaderView;
        } else if (indexPath.section == 1) {
            Bungumi_PreviousHeaderView *previousHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kPreviousHeaderIdentifier forIndexPath:indexPath];
            reusableView = previousHeaderView;
        }
    }
    
    return reusableView;
}



#pragma mark- UICollectionViewDelegateFlowLayout 


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return  CGSizeMake(screenWidth, 287);
            break;
        case 1:
            return [Bungumi_PreviousHeaderView sizeOfBungumi_PreviousHeaderView];
            break;
        default:
            break;
    };
    return CGSizeZero;
}


/*
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            CGFloat itemWidth = (screenWidth - 2 * 12 - 2 * InteritemSpacing) / 3.0;
            CGFloat itemHeight = 205;
            return CGSizeMake(itemWidth, itemHeight);
        }
            break;
        case 1:
            return [Bungumi_PreviousCell sizeOfBungumi_PreviousCell];
            break;
            
        default:
            break;
    }
    return CGSizeZero;
}
*/


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    UIEdgeInsets edge ;
    if (section != 2) {
        edge = UIEdgeInsetsMake(12, 12, 24, 12);
    } else {
        edge = UIEdgeInsetsMake(12, 12, 0, 12);
    }
    
    return edge;
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
