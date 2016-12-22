//
//  AGBaseRequest.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/17.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "AGBaseRequest.h"

@implementation AGBaseRequest

- (NSInteger)responseCode {
    if (self.responseObject) {
        return [[self.responseObject valueForKey:@"code"] integerValue];
    } else {
        return  -1;
    }
}

- (id)responseData {
    if (self.responseObject) {
        id data = [self.responseObject valueForKey:@"data"];
        if (data) {
            return data;
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}

- (NSString *)errorMsg {
    if (self.error) {
        return self.error.localizedDescription;
    } else if ([self.responseData objectForKey:@"message"]) {
        return [self.responseData objectForKey:@"message"];
    } else {
        return @"网络请求出错";
    }
}

- (void)startWithCompletionBlock:(void (^)(AGBaseRequest *))completionBlock {
    [super startWithCompletionBlock:completionBlock];
}

@end
