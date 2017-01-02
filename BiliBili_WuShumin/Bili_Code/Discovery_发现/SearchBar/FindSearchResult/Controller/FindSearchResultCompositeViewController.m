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

@interface FindSearchResultCompositeViewController ()

@property (nonatomic, strong) FindSearchResultCompositeView *compositeView;

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
    self.compositeView = [[FindSearchResultCompositeView alloc] initWithFrame:CGRectZero];
    _compositeView.resultModel = _resultModel;
    [self.view addSubview:_compositeView];
    [_compositeView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
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
