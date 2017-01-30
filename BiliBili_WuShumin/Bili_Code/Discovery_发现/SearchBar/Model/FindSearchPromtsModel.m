//
//  FindSearchPromtsModel.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/22.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "FindSearchPromtsModel.h"
#import "FindSearchPromptsRequest.h"

@interface FindSearchPromtsModel ()
{
    FindSearchPromptsRequest *_searchPromptsRequest;
}

@end

@implementation FindSearchPromtsModel
@synthesize historyWordArray = _historyWordArray;

- (instancetype)init {
    self = [super init];
    if (self) {
        // 获取历史搜索记录
        _historyWordArray = [[NSMutableArray alloc] initWithContentsOfFile:[self pathOfHistoryWord]];
        // 进行网络请求
        _searchPromptsRequest = [FindSearchPromptsRequest request];
    }
    return self;
}



- (void)getPromptsWordArrayWithKeyword:(NSString *)keyword success:(void (^)(void))success failure:(void (^)(NSString *))failure {
    [_searchPromptsRequest stop]; // 取消上一个网络请求
    _searchPromptsRequest.keyword = keyword;
    [_searchPromptsRequest startWithCompletionBlock:^(AGBaseRequest *request) {
        if (request.responseCode == 0) {
            NSDictionary *rawDic = request.responseObject;
            _promptsWordArray = [[NSMutableArray alloc] initWithCapacity:rawDic.count];
            [rawDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                [_promptsWordArray addObject:[obj objectForKey:@"name"]];
            }];
            success();
        } else {
            if (failure) {
                failure(request.errorMsg);
            }
        }
    }];
}

#pragma mark- 获取历史记录路径

- (NSString *)pathOfHistoryWord {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    return [path stringByAppendingPathComponent:@"Find_SearchHistory.plist"];
}

- (void)removeAllHistoryWord {
    [@[] writeToFile:[self pathOfHistoryWord] atomically:YES]; // 写一个空数组
    _historyWordArray = [[NSMutableArray alloc] initWithContentsOfFile:[self pathOfHistoryWord]];
}

- (void)addHistoryWord:(NSString *)word { // 添加历史记录
    // 添加历史记录
    // 1. 如果 length == 0 返回
    if (word.length == 0) {
        return;
    }
    
    // 2. 获取 plist文件
    NSMutableArray *mutableArray = [NSMutableArray arrayWithContentsOfFile:[self pathOfHistoryWord]];
    if (mutableArray == nil) {
        mutableArray = [NSMutableArray array];
    }
    // 3. 先移除，然后添加到 0
    [mutableArray removeObject:word];
    [mutableArray insertObject:word atIndex:0];
    
    // 4. 最多5个
    if (mutableArray.count == 6) {
        [mutableArray removeLastObject];
    }
    
    // 5. 写入
    [mutableArray writeToFile:[self pathOfHistoryWord] atomically:YES];
}

// get 方法
- (NSMutableArray<NSString *> *)historyWordArray {
    return [[NSMutableArray alloc] initWithContentsOfFile:[self pathOfHistoryWord]];
}





@end
