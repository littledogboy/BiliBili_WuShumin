//
//  HotWordViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 17/2/7.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import "HotWordViewController.h"
#import "AGTagListView.h"
#import "FindHotwordModel.h"

#define kUnfoldHeight 278
#define kFoldHeight 173

@interface HotWordViewController ()

@property (nonatomic, strong) AGTagListView *tagListView;
@property (nonatomic, strong) UIButton *foldButton;
@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) NSMutableArray *tagListTitleArray;
@property (nonatomic, strong) FindHotwordModel *hotwordModel;
@property (nonatomic, assign) BOOL isUnFold; // 默认为no
@end

@implementation HotWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNetData];
    [self setupSubViews];
    // Do any additional setup after loading the view.
}

- (void)setupSubViews {
    // titleLabel
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.text = @"大家都在搜";
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:_titleLabel];
    [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).offset(12);
    }];
    
    // tagListView
    self.tagListView = [[AGTagListView alloc] init];
    _tagListView.titleColor = [UIColor whiteColor];
    _tagListView.tagBgColor = [UIColor colorWithWhite:1 alpha:0.3];
    _tagListView.backgroundColor = [UIColor colorWithRed:250/255.0 green:114/255.0 blue:152/255.0 alpha:1.0];
    _tagListView.cornerRadius = 5;
    _tagListView.collectionView.scrollEnabled = NO; //  默认非展开下不允许滚动
    // block
    WS(ws);
    _tagListView.tagDidSelectedBlock = ^(NSString *cellTitle) {
        if (ws.didSelectedCellBlock) {
            ws.didSelectedCellBlock(cellTitle);
        }
    };
    [self.view addSubview:_tagListView];
    [_tagListView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.bottom);
        make.left.right.equalTo(self.view);
//        make.height.equalTo(@90);
    }];
    
    // foldButton
    self.foldButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _foldButton.tintColor = [UIColor whiteColor];
    [_foldButton setImage:[UIImage imageNamed:@"search_openMore"] forState:(UIControlStateNormal)];
    _foldButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [_foldButton setTitle:@"查看更多" forState:(UIControlStateNormal)];
    [_foldButton addTarget:self action:@selector(foldAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_foldButton];
    [_foldButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tagListView.bottom); // 约束添加到后添加的控件上
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@55);
    }];
    
    [_foldButton.imageView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_foldButton).offset(-30).priority(MASLayoutPriorityRequired);
        make.centerY.equalTo(_foldButton);
    }];
    
    UIImage *image = [[UIImage imageNamed:@"search_moreLine"] imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.foldButton addSubview:imageView];
    [imageView makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_foldButton);
        make.height.equalTo(@(1.5));
    }];
}

- (void)loadNetData {
    self.hotwordModel = [[FindHotwordModel alloc] init];
    [_hotwordModel getHotWordEntityWithSuccess:^{
        self.tagListTitleArray = [NSMutableArray array];
        for (FindHotwordList *list in _hotwordModel.listArray) {
            [_tagListTitleArray addObject:list.keyword];
        }
        self.tagListView.tagsArray = _tagListTitleArray;
    } failure:^(NSString *msg) {
        NSLog(@"%@", msg);
    }];
}

- (void)foldAction:(UIButton *)button {
    [self.view updateConstraints:^(MASConstraintMaker *make) {
        if (!self.isUnFold) { // 未展开， 展开
            UIImage *image = [[UIImage imageNamed:@"search_closeMore"] imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
            [_foldButton setImage:image forState:(UIControlStateNormal)];
            [_foldButton setTitle:@"收起" forState:(UIControlStateNormal)];
            _tagListView.collectionView.scrollEnabled = YES;
            make.height.equalTo(@(kUnfoldHeight));
        } else { // 已展开， 收缩
            UIImage *image = [[UIImage imageNamed:@"search_openMore"] imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];

            [_foldButton setImage:image forState:(UIControlStateNormal)];
            [_foldButton setTitle:@"查看更多" forState:(UIControlStateNormal)];
            _tagListView.collectionView.scrollEnabled = NO;
            _tagListView.collectionView.contentOffset = CGPointZero;
            make.height.equalTo(@(kFoldHeight));
        }
        self.isUnFold = !self.isUnFold;
    }];
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
