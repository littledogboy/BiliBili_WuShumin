//
//  CategoryIndexViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/11/2.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "CategoryIndexViewController.h"
#import "CategoryIndexModel.h"
#import "CategoryIndexView.h"

@interface CategoryIndexViewController ()

@property (nonatomic, strong) NSMutableArray *categoryArray;
@property (nonatomic, strong) CategoryIndexView *categoryIndeView;

@end

@implementation CategoryIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
    [self addIndexView];
    // Do any additional setup after loading the view.
}

#pragma mark- data

- (void)getData {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"CategoryIndexList" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    if (array) {
        self.categoryArray = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            CategoryIndexModel *category = [[CategoryIndexModel alloc] init];
            [category setValuesForKeysWithDictionary:dic];
            [self.categoryArray addObject:category];
        }
        NSLog(@"%@", self.categoryArray);
    }
}

#pragma mark- addCollectionView
- (void)addIndexView {
    self.categoryIndeView = [[CategoryIndexView alloc] initWithFrame:CGRectZero];
    _categoryIndeView.categoryArray = self.categoryArray;
    [self.view addSubview:_categoryIndeView];
    WS(ws);
    [_categoryIndeView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view);
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
