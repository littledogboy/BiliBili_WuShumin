//
//  FindSearchResultRequest.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/24.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "FindSearchResultRequest.h"

@implementation FindSearchResultRequest

- (NSString *)URLString {
    return [[NSString stringWithFormat:@"http://app.bilibili.com/x/v2/search?actionKey=appkey&appkey=27eb53fc9058f8c3&build=4000&device=phone&duration=0&keyword=%@&mobi_app=iphone&order=default&platform=ios&pn=1&ps=20&rid=0", _keyword] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (HTTPMethod)method {
    return HTTPMethodGet;
}

- (NSTimeInterval)cacheTimeoutInterval {
    return 30 * 60;
}

@end
