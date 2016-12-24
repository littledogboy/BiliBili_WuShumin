//
//  FindSearchResultRootViewController.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/25.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "FindSearchResultRootViewController.h"

@interface FindSearchResultRootViewController ()

@end

@implementation FindSearchResultRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)topViewHeight {
    return 45;
}

- (CGFloat)menuViewHeight {
    return 35;
}

- (CGFloat)menuViewTop {
    return 10;
}

- (CGFloat)titleMargin {
    return ((screenWidth - 5 * self.titleWidth) / 4);
}

- (CGFloat)titleWidth {
    return 64;
}

- (CGFloat)titleHeight {
    return 20;
}

- (CGFloat)contentViewHeight {
    return screenHeight - self.topViewHeight - 49 - 63;
    
}

- (UIFont *)titleFont {
    return [UIFont systemFontOfSize:15];
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
