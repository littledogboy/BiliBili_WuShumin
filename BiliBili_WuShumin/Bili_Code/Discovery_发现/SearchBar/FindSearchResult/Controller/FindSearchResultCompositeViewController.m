//
//  FindSearchResultCompositeViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/25.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "FindSearchResultCompositeViewController.h"
#import "FindSearchResultCompositeView.h"
#import "FindSearchResultModel.h"

#import "AGSortedView.h" // 导入 分类 视图

@interface FindSearchResultCompositeViewController ()

@property (nonatomic, strong) FindSearchResultCompositeView *compositeView;
@property (nonatomic, strong) AGSortedView *sortedView;

@end

@implementation FindSearchResultCompositeViewController

- (void)setResultModel:(FindSearchResultModel *)resultModel {
        _resultModel = resultModel;
        self.compositeView.resultModel = _resultModel; // 刷新数据
}

- (instancetype)initWithKeyWord:(NSString *)keyWord model:(FindSearchResultModel *)resultModel {
    self = [super init];
    if (self) {
        self.keyword = keyWord;
        self.resultModel = resultModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    [self setupSubViews];
}

- (void)setupSubViews {
    // sortedView
    self.sortedView = [[AGSortedView alloc] initWithFrame:CGRectZero];
    WS(ws);
    _sortedView.didSelectedTitleBlock = ^(NSArray *array) {
        ws.resultModel.order = [OrderDic objectForKey:array[0]];
        ws.resultModel.duration = [[DurationDic objectForKey:array[1]] integerValue];
        ws.resultModel.rid = [[RidDic objectForKey:array[2]] integerValue];
        [ws.resultModel getSearchResultEntityWithSuccess:^{
            ws.compositeView.resultModel = ws.resultModel; // reloadData
            ws.compositeView.contentOffset = CGPointZero; // resetoffSet
        } failure:^(NSString *errorMsg) {
            NSLog(@"%@", errorMsg);
        }];
    };
    [self.view addSubview:_sortedView];
    [_sortedView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.width.equalTo(self.view);
    }];
    
    // compositeView
    self.compositeView = [[FindSearchResultCompositeView alloc] initWithFrame:CGRectZero];
    _compositeView.resultModel = _resultModel;
    [self.view insertSubview:_compositeView belowSubview:_sortedView];
    [_compositeView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(40, 0, 0, 0));
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
