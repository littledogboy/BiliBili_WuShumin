//
//  AGSortedView.m
//  AGSortedView
//
//  Created by 吴书敏 on 17/2/1.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import "AGSortedView.h"
#import <Masonry.h>
#import "AGFirstTitleCollectionViewCell.h"
#import "AGSecondTitleCollectionView.h"

#define kFirstTitleCellIdentifier @"firstTitle"
#define kPerRowHeight 40

@interface AGSortedView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    CGFloat _firstViewHeight;
    CGFloat _secondViewHeight;
}

@property (nonatomic, strong) UICollectionView *firstTitleCollectionView; // 1 级 标题
@property (nonatomic, strong) AGSecondTitleCollectionView *secondTitleCollectionView; // 2 级标题
@property (nonatomic, strong) AGFirstTitleCollectionViewCell *firstTitleSelectedCell; // 1 级选中cell
@property (nonatomic, strong) NSIndexPath *firstViewSelectedIndexPath;
@property (nonatomic, strong) NSArray *secondTitleArray;

@property (nonatomic, strong) UIView *grayView; // 灰色背景图

@property (nonatomic, assign) NSInteger firstSelectedIndex;

@property (nonatomic, strong) NSMutableArray *selectedTitleArray;

@end

@implementation AGSortedView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化数据
        self.titlesArray = @[@[@"默认排序", @"播放多", @"新发布", @"弹幕多"],
                             @[@"全部时长", @"1-10分钟", @"10-30分钟", @"30-60分钟", @"60分钟+"],
                             @[@"全部分区", @"番剧", @"动画", @"音乐", @"舞蹈", @"游戏", @"科技", @"生活", @"鬼畜", @"时尚", @"广告", @"娱乐", @"电影", @"电视剧"]];
        // 默认选中下标
        self.selectedIndexArray = [@[@0, @0, @0] mutableCopy];
        // 默认选中标题
        self.selectedTitleArray = [NSMutableArray arrayWithCapacity:self.titlesArray.count];
        for (NSArray *titles in self.titlesArray) {
            [_selectedTitleArray addObject:titles[0]];
        }
        // 加载子视图
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsZero;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    CGFloat width = ([UIScreen mainScreen].bounds.size.width) / 3.0;
    _firstViewHeight = self.titlesArray.count / 3 * kPerRowHeight;
    flowLayout.itemSize = CGSizeMake(width, _firstViewHeight);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _firstTitleCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _firstTitleCollectionView.backgroundColor = [UIColor whiteColor];
    _firstTitleCollectionView.delegate = self;
    _firstTitleCollectionView.dataSource = self;
    [self addSubview:_firstTitleCollectionView];
    
    [_firstTitleCollectionView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(@(_firstViewHeight));
    }];
    
    // regist cell
    [_firstTitleCollectionView  registerClass:[AGFirstTitleCollectionViewCell class] forCellWithReuseIdentifier:kFirstTitleCellIdentifier];
    
    //
    self.grayView = [[UIView alloc] initWithFrame:CGRectZero];
    _grayView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
    _grayView.hidden = YES;
    // 手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(grayViewTap:)];
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(grawViewSwipe:)];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(grayViewPan:)];
    swipe.direction = UISwipeGestureRecognizerDirectionUp;
    [_grayView addGestureRecognizer:tap];
    [_grayView addGestureRecognizer:swipe];
    [_grayView addGestureRecognizer:pan];
    [self addSubview:_grayView];
    [_grayView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstTitleCollectionView.bottom);
        make.left.right.bottom.equalTo(self);
    }];
    
}

#pragma mark- addSecondTitleView

- (void)addSecondTitleCollectionViewWithIndexPath:(NSIndexPath *)indexPath {
    
    if (self.secondTitleCollectionView == nil) {
        self.secondTitleCollectionView = [[AGSecondTitleCollectionView alloc] initWithFrame:CGRectZero titleArray:_secondTitleArray];
        [self addSubview:_secondTitleCollectionView];
        
        // 添加约束
        [_secondTitleCollectionView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.firstTitleCollectionView.bottom);
            make.left.right.equalTo(self);
            make.height.equalTo(@(0));
        }];
        // tag: 添加一个标记，isFirstSread ，来标记是否为一次展开
        if (_secondTitleCollectionView.isFirstSread == YES) { // 第一次展开，
            // 先添加 0 约束
            [self setNeedsUpdateConstraints];
            [self updateConstraintsIfNeeded];
            [self layoutIfNeeded];
            _secondTitleCollectionView.isFirstSread = NO; // 后面在更新height约束
        }
    } else {
        // 更新数据源
        self.secondTitleCollectionView.titleArray = _secondTitleArray;
    }
    
    // 选中下标
    self.secondTitleCollectionView.selectedIndex = [self.selectedIndexArray[indexPath.item] integerValue];
    // 给block赋值
    __weak typeof(self)WeakSelf = self;
    _secondTitleCollectionView.didSelectedCellBlock = ^(NSNumber *selectedItem) {
        WeakSelf.selectedIndexArray[indexPath.row] = selectedItem; // 选中下标
        NSInteger index = [selectedItem integerValue];
        WeakSelf.selectedTitleArray[indexPath.row] = WeakSelf.titlesArray[indexPath.row][index]; // 选中标题
        WeakSelf.didSelectedTitleBlock(WeakSelf.selectedTitleArray); // 执行block
        [WeakSelf contract];
    };
    
    // 更新约束
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        // 动画完成后显示cell
        NSArray *array = [_secondTitleCollectionView visibleCells];
        for (UICollectionViewCell *cell in array) {
            cell.hidden = NO;
        }
    }];
}

#pragma mark- titleOfIndexPath

- (NSString *)titleOfIndexPath:(NSIndexPath *)indexPath {
    NSString *title = self.titlesArray[indexPath.row][0];
    return title;
}

- (NSArray *)secondTitleArrayOfIndexPath:(NSIndexPath *)indexPath {
    return self.titlesArray[indexPath.row];
}

#pragma mark- collectionDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titlesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AGFirstTitleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kFirstTitleCellIdentifier forIndexPath:indexPath];
    [cell.button setTitle:[self titleOfIndexPath:indexPath] forState:(UIControlStateNormal)];
    return cell;
}

#pragma mark- collectionDelegate
// 选中时
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // 选中下标
    _firstViewSelectedIndexPath = indexPath;
    // 获取 cell
    AGFirstTitleCollectionViewCell *cell = (AGFirstTitleCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    self.firstTitleSelectedCell = cell;
    
    if (cell.isSelected == NO) { // 未选中
        cell.isSelected = YES;
        // 获取 model
        self.secondTitleArray = [self secondTitleArrayOfIndexPath:indexPath];
        // 添加 secondTitleView
        [self addSecondTitleCollectionViewWithIndexPath:indexPath];
        // 灰色背景图
        self.grayView.hidden = NO;
        // 更新高度
        CGFloat height = self.superview.bounds.size.height;
        [self updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(height));
        }];
        
    } else { // 已选中
        cell.isSelected = NO;
        self.secondTitleArray = nil; // 不展开
        [self addSecondTitleCollectionViewWithIndexPath:indexPath];
        self.grayView.hidden = YES;
        // 更新高度
        [self updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@40);
        }];
    }
}

// 未选中时
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    AGFirstTitleCollectionViewCell *cell = (AGFirstTitleCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.isSelected = NO;
}

#pragma mark- 更新约束

- (void)updateConstraints {
    if (self.secondTitleCollectionView) {
        // 1. 获取 secondTitleView height
        CGFloat perRowCout = _secondTitleArray.count >=5 ? 5.0 : _secondTitleArray.count;
        NSInteger rowCout = ceil(_secondTitleArray.count / perRowCout); // 向上取整，行数
        CGFloat height = _secondTitleCollectionView.isFirstSread ? 0 : rowCout * kPerRowHeight;
        // 2. 更新约束
        [_secondTitleCollectionView updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(height));
        }];
    }
    [super updateConstraints];
}

#pragma mark- 让父视图也可以相应事件

- (void)grayViewTap:(UITapGestureRecognizer *)tap {
    [self contract];
}

- (void)grawViewSwipe:(UISwipeGestureRecognizer *)swipe {
    [self contract];
}

- (void)grayViewPan:(UIPanGestureRecognizer *)pan {
    if (pan.state == UIGestureRecognizerStateEnded) {
        [self contract];
    }
}

// 扩张
- (void)expand {
    
}

// 收缩
- (void)contract {
    self.firstTitleSelectedCell.isSelected = NO;
    self.secondTitleArray = nil; // 不展开
    [self addSecondTitleCollectionViewWithIndexPath:_firstViewSelectedIndexPath];
    self.grayView.hidden = YES;
    // 更新高度
    [self updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
    }];

}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
