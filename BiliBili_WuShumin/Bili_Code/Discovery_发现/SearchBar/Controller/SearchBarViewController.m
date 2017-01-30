//
//  SearchBarViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/8.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "SearchBarViewController.h"
#import "FindSearchPromtsTableView.h"
#import "FindSearchPromtsModel.h"
#import "FindSearchResultViewController.h"
#define kTipCellIdentifier @"tipCellIdentifier"

@interface SearchBarViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIScrollView *topScrollView;
@property (nonatomic, strong) UIButton *RQButton; // 二维码扫描
@property (nonatomic, strong) UITextField *searchTF; // 搜索框
@property (nonatomic, strong) UIButton *cancelButton; // 取消按钮

// 搜索提示tableView
@property (nonatomic, strong) FindSearchPromtsTableView *searchPromtsTableView;; // 搜索提示
@property (nonatomic, strong) FindSearchPromtsModel *searchPromtsModel; //

// 搜索结果
@property (nonatomic, strong) FindSearchResultViewController *searchResultVC;

@end

@implementation SearchBarViewController

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 63)];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self addTopView];
}

- (void)setKeyWord:(NSString *)keyWord {
    _keyWord = keyWord;
    self.searchPromtsModel = [[FindSearchPromtsModel alloc] init];
}

- (void)addTopView {
    self.topView = [[UIView alloc] initWithFrame:CGRectZero];
    _topView.backgroundColor = SAKURACOLOR;
    [self.view addSubview:_topView];
    WS(ws);
    [_topView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.width.equalTo(ws.view);
        make.height.equalTo(@(63));
    }];
    
    // scrollView
    self.topScrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    _topScrollView.backgroundColor = SAKURACOLOR;
    _topScrollView.alwaysBounceHorizontal = NO;
    _topScrollView.showsHorizontalScrollIndicator = NO;
    _topScrollView.scrollEnabled = NO; // 不允许滑动
    [self.view addSubview:_topScrollView];
    [_topScrollView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(26));
        make.left.width.equalTo(ws.topView);
        make.height.equalTo(@(31));
    }];
    
    // scrollViewContentView
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectZero];
    contentView.backgroundColor = SAKURACOLOR;
    [self.topScrollView addSubview:contentView];
    
    [contentView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.topScrollView);
        make.height.equalTo(ws.topScrollView);
    }];
    
    // rqButton
    self.RQButton = [UIButton buttonWithType:UIButtonTypeRoundedRect]; // roundedRect
    [_RQButton setImage:[UIImage imageNamed:@"search_qr"] forState:(UIControlStateNormal)];
    _RQButton.tintColor = [UIColor whiteColor];
    [contentView addSubview:_RQButton];
    [_RQButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(15));
        make.width.height.equalTo(@(31));
        make.top.equalTo(0);
    }];
    
    // searchTF
    self.searchTF = [[UITextField alloc] initWithFrame:CGRectZero];
    UIImageView *leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"misc_search"]];
    leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    leftImageView.frame = CGRectMake(0, 0, 40, 25);
    _searchTF.leftView = leftImageView;
    _searchTF.leftViewMode = UITextFieldViewModeAlways;
    _searchTF.layer.cornerRadius = 4.0;
    _searchTF.layer.borderWidth = 0.1;
    _searchTF.layer.masksToBounds = YES;
    _searchTF.font = [UIFont systemFontOfSize:15];
    _searchTF.textColor = [UIColor grayColor];
    _searchTF.text = _keyWord;
    _searchTF.backgroundColor = [UIColor whiteColor];
    _searchTF.clearButtonMode = UITextFieldViewModeAlways;
    _searchTF.delegate = self;
    [_searchTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:(UIControlEventEditingChanged)];
    _searchTF.returnKeyType = UIReturnKeyGoogle;
    // 设置 placeholder 颜色
    _searchTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"搜索视频、番剧、up主或AV号"
                                                                      attributes:@{NSForegroundColorAttributeName : RGBCOLOR(179, 179, 179)}];
    [contentView addSubview:_searchTF];
    [_searchTF makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.RQButton.right).offset(10);
        make.top.equalTo(@(0));
        make.height.equalTo(@(31));
        make.width.equalTo(@(screenWidth - 15 - 31 - 10 - 10));
    }];
    
    // cancelBt
    self.cancelButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.cancelButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [_cancelButton setTitle:@"取消" forState:(UIControlStateNormal)];
    _cancelButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [_cancelButton addTarget:self action:@selector(cancelAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [contentView addSubview:_cancelButton];
    [_cancelButton makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(31);
        make.width.greaterThanOrEqualTo(31);
        make.left.equalTo(ws.searchTF.right).offset(10);
        make.right.equalTo(contentView.right).offset(-12);
        make.centerY.equalTo(ws.searchTF);
    }];
}

#pragma mark- UITextFieleDelegate 

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.topScrollView setContentOffset:CGPointMake(self.searchTF.frame.origin.x - 10, 0) animated:YES];  // 偏移动画
    self.view.frame = CGRectMake(0, 0, screenWidth, screenHeight); // 调整 view 大小
    [self addSearchPromtsTableView];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // 判断是否有内容，如果有：1 . 取消第一响应者 2. 进入搜索结果VC
    // 没有内容，什么也不做
    // 设置keyWord
    self.keyWord = textField.text;
    if (textField.text.length) {
        [textField resignFirstResponder];
        self.keyWord = textField.text;
        [self.searchPromtsModel addHistoryWord:textField.text]; // 添加历史记录
        [self addSearchResultVC];
        return YES;
    } else {
        return NO;
    }
}

#pragma mark- textFiledValueChanged
- (void)textFieldDidChange:(UITextField *)tf {
    self.searchPromtsTableView.keyWord = tf.text;
}

- (void)cancelAction:(UIButton *)button {
    self.searchTF.text = nil;
    [self.searchTF resignFirstResponder];
    [self.topScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    self.view.frame = CGRectMake(0, 0, screenWidth,63);
    [self.searchPromtsTableView removeFromSuperview]; // 移除tipsTableView
    [self removeSearchResultVC];

}

#pragma mark-
#pragma mark  添加 搜索提示 tableView

- (void)addSearchPromtsTableView {
    // rowHeight 45
    self.searchPromtsTableView = [[FindSearchPromtsTableView alloc] initWithModel:self.searchPromtsModel];
    WS(ws);
    _searchPromtsTableView.didSelectCellBlock = ^void(NSString *keyword) {
        ws.searchTF.text = keyword; // 搜索框为选中关键字
        [ws.searchPromtsModel addHistoryWord:keyword]; // 添加历史记录
        [ws.searchTF resignFirstResponder]; // 取消第一响应者
        [ws addSearchResultVC]; // 显示搜索结果
    };
    [self.view addSubview:_searchPromtsTableView];
    [_searchPromtsTableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(63));
        make.left.right.bottom.equalTo(ws.view);
    }];
   
}

- (void)addSearchResultVC {
    self.searchResultVC = [[FindSearchResultViewController alloc] initWithKeyword:_keyWord];
    [self.view addSubview:_searchResultVC.view];
    [self addChildViewController:_searchResultVC];
    [_searchResultVC.view makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(63));
        make.left.right.bottom.equalTo(self.view);
    }];
}

- (void)removeSearchResultVC {
    [self.searchResultVC.view removeFromSuperview];
    [self.searchResultVC removeFromParentViewController];
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
