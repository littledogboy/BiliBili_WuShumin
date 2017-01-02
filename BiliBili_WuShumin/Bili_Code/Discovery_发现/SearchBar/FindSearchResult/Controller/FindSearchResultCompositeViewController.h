//
//  FindSearchResultCompositeViewController.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/25.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FindSearchResultModel;

@interface FindSearchResultCompositeViewController : UIViewController

- (instancetype)initWithKeyWord:(NSString *)keyWord model:(FindSearchResultModel *)resultModel;

@property (nonatomic, strong) NSString *keyword;
@property (nonatomic, strong) FindSearchResultModel *resultModel;

@end
