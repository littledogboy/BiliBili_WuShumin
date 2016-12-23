//
//  FindSearchPromtsTableView.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/23.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FindSearchPromtsModel;


@interface FindSearchPromtsTableView : UITableView

@property (nonatomic, strong) NSMutableArray<NSString *> *wordArray;
@property (nonatomic, strong) NSString *keyWord;
@property (nonatomic, assign) NSInteger avID;

@property (nonatomic, copy) void(^didSelectCellBlock)(NSString *keyword);

- (instancetype)initWithModel:(FindSearchPromtsModel *)model;



@end
