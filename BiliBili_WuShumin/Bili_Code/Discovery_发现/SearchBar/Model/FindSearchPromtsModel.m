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



@end
