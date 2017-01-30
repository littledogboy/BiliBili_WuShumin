//
//  FindSearchResultModel.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/24.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "FindSearchResultModel.h"
#import "FindSearchResultRequest.h"
#import "FindData.h"

@interface FindSearchResultModel ()
{
    FindSearchResultRequest *_resultRequest;
}

@end

@implementation FindSearchResultModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _resultRequest = [[FindSearchResultRequest alloc] init];
        self.archiveArray = [NSMutableArray array];
    }
    return self;
}

- (void)setKeyWord:(NSString *)keyWord {
    _keyWord = keyWord;
    _resultRequest.keyword = keyWord;
}

- (void)getSearchResultEntityWithSuccess:(void (^)(void))success failure:(void (^)(NSString *errorMsg))failure {
    [_resultRequest stop];
    _resultRequest.pn = 0;
    [self getMoreSearchResultEntityWithSuccess:success failure:failure];
}

- (void)getMoreSearchResultEntityWithSuccess:(void (^)(void))success failure:(void (^)(NSString *eoorMsg))failure {
    _resultRequest.pn++; // 页数加1
    [_resultRequest startWithCompletionBlock:^(AGBaseRequest *request) {
        if (request.responseCode == 0) {
            // 1. 获取每页的 archive
            NSArray *archivesArray = [request.responseData valueForKeyPath:@"items.archive"];
            // judge：如果后面的请求没有数据，则不再执行 success，直接return
            if (archivesArray.count == 0 && _resultRequest.pn != 1) {
                return;
            }
            // 2. 把 dic:archive -> archive:archive，并添加到总数组中
            for (NSDictionary *archiveItem in archivesArray) {
                FindArchive *archive = [[FindArchive alloc] initWithDictionary:archiveItem];
                [self.archiveArray addObject:archive];
            }
            // 3. 初始化 resultData 然后，给 archive 重新复制
            self.resultData = [[FindData alloc] initWithDictionary:request.responseData];
            self.resultData.items.archive = self.archiveArray;
            success();
        } else {
            failure(request.errorMsg);
        }
    }];
}
@end
