//
//  FindSearchResultRequest.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/24.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "FindSearchResultRequest.h"

@implementation FindSearchResultRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        self.order = 0;
        self.duration = 0;
        self.order = @"default";
        self.pn = 0;
        self.ps = 20;
        self.rid = 0;
    }
    return self;
}

- (NSString *)URLString {
    NSString *urlString = [[NSString stringWithFormat:@"http://app.bilibili.com/x/v2/search?actionKey=appkey&appkey=27eb53fc9058f8c3&build=4000&device=phone&duration=%lu&keyword=%@&mobi_app=iphone&order=%@&platform=ios&pn=%lu&ps=%lu&rid=%lu", _duration,_keyword, _order, _pn, _ps, _rid] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return urlString;
}

- (HTTPMethod)method {
    return HTTPMethodGet;
}

- (NSTimeInterval)cacheTimeoutInterval {
    return 30 * 60;
}

@end
