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
    }
    return self;
}

- (void)setKeyWord:(NSString *)keyWord {
    _keyWord = keyWord;
    _resultRequest.keyword = keyWord;
}

- (void)getSearchResultEntityWithSuccess:(void (^)(void))success failure:(void (^)(NSString *errorMsg))failure {
    [_resultRequest startWithCompletionBlock:^(AGBaseRequest *request) {
        if (request.responseCode == 0) {
            // 给 data 赋值
            self.resultData = [[FindData alloc] initWithDictionary:request.responseData];
            success();
        } else {
            failure(request.errorMsg);
        }
    }];
}



@end
