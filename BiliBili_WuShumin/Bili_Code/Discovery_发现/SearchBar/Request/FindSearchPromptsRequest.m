//
//  FindSearchPromptsRequest.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/22.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "FindSearchPromptsRequest.h"

@implementation FindSearchPromptsRequest

- (NSString *)URLString {
    return [[@"http://api.bilibili.com/suggest?actionKey=appkey&appkey=27eb53fc9058f8c3&term=" stringByAppendingString:self.keyword] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; // 中文编码
}

- (HTTPMethod)method {
    return HTTPMethodGet;
}

- (NSTimeInterval)cacheTimeoutInterval {
    return 60 * 30;
}

@end
