//
//  CategoryViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/11/2.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "CategoryViewController.h"
#import "CategoryIndexViewController.h"

@interface CategoryViewController ()

//@property (nonatomic, strong) CategoryIndexViewController *categoryIndexVC;

@end

@implementation CategoryViewController

//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        self.categoryIndexVC = [[CategoryIndexViewController alloc] init];
//        self.viewControllers = @[_categoryIndexVC];
//        self.menuTitleArray = @[@"分类"];
//        self.isHiddrenUnderLine = YES;
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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
