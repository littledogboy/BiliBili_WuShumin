//
//  FindSearchPromtsTableView.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/23.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "FindSearchPromtsTableView.h"
#import "FindSearchPromtsModel.h"

@interface FindSearchPromtsTableView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) FindSearchPromtsModel *searchPromtsModel;

@end

@implementation FindSearchPromtsTableView

- (instancetype)initWithModel:(FindSearchPromtsModel *)model {
    self = [super initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    if (self) {
        self.rowHeight = 45;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.searchPromtsModel = model;
        self.wordArray = model.historyWordArray;
        self.dataSource = self;
        self.delegate = self;
        [self setExtraCellLineHidden];
    }
    return self;
}

- (void)setKeyWord:(NSString *)keyWord {
    _keyWord = keyWord;
    if (_keyWord.length) { // 如果不为空, 进行网络请求
        _wordArray = [[NSMutableArray alloc] init];
        if ([self stringByAVID].length) [_wordArray addObject:[self stringByAVID]];
        
            [_searchPromtsModel getPromptsWordArrayWithKeyword:keyWord success:^{
                [_wordArray addObjectsFromArray:_searchPromtsModel.promptsWordArray];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self reloadData];
                });
            } failure:^(NSString *errorMsg) {
                // nil
            }];
        
    } else { // 如果为空显示历史记录
        _wordArray = _searchPromtsModel.historyWordArray;
    }
    [self reloadData]; // 1. 初始显示历史记录，网络请求后，显示请求记录
}

- (NSString *)stringByAVID {
    NSString *string = _keyWord;
    if (_keyWord.length > 2) {
        NSString *str = [_keyWord substringToIndex:2];
        if ([str caseInsensitiveCompare:@"av"] == NSOrderedSame) {
            string = [_keyWord substringFromIndex:2];
        }
    }
    
    NSInteger iValue = [string integerValue];
    if (iValue && [[NSString  stringWithFormat:@"%lu", iValue] isEqualToString:string]) {
        return [NSString stringWithFormat:@"av%lu", iValue];
    }
    return @"";
}

#pragma mark- DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 两种情况 1. 显示历史记录 2. 实时搜索
    // 1. 显示历史记录
    if (_keyWord.length == 0 && _wordArray.count != 0) {
        return _wordArray.count + 1;
    } else { // 2. 实时搜索
        return _wordArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = RGBCOLOR(100, 100, 100);
    }
    
    if (_keyWord.length) { // 实时搜索
        if ([self stringByAVID].length && indexPath.row == 0) {
            UILabel *label = [[UILabel alloc] init];
            label.text = @"进入";
            label.font = [UIFont systemFontOfSize:15];
            label.textColor = RGBCOLOR(230, 140, 150);
            [cell addSubview:label];
            [label makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(cell);
                make.size.equalTo(CGSizeMake(44, 44));
                make.right.equalTo(cell);
            }];
        }
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.imageView.image = nil;
        cell.textLabel.text = _wordArray[indexPath.row];
    } else { // 显示历史记录
        if (indexPath.row == _wordArray.count) {
            cell.imageView.image = nil;
            cell.textLabel.text = @"清除搜索历史";
            cell.textLabel.textAlignment = NSTextAlignmentCenter; // 居中
        } else {
            cell.imageView.image = [UIImage imageNamed:@"search_history_icon"];
            cell.textLabel.text = _wordArray[indexPath.row];
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
        }
    }
    
    return cell;
}

#pragma mark- delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_keyWord.length) {
        self.didSelectCellBlock(_wordArray[indexPath.row]);
    } else if(indexPath.row == _wordArray.count){ // 移除所有历史记录
        [self.searchPromtsModel removeAllHistoryWord];
        self.keyWord = nil;
    }
}

#pragma mark- 隐藏多余cell
- (void)setExtraCellLineHidden {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:view];
}




@end















