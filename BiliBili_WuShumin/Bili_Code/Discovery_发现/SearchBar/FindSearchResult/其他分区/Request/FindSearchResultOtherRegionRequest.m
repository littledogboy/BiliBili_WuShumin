//
//  FindSearchResultOtherRegionRequest.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/26.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "FindSearchResultOtherRegionRequest.h"

@implementation FindSearchResultOtherRegionRequest

- (NSString *)URLString {
    NSString *url = [NSString stringWithFormat:@"http://app.bilibili.com/x/v2/search/type?actionKey=appkey&appkey=27eb53fc9058f8c3&build=4000&device=phone&keyword=%@&mobi_app=iphone&platform=ios&pn=%lu&ps=%lu&type=%lu", _keyword, _pn, _ps, _type];
    return [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (HTTPMethod)method {
    return HTTPMethodGet;
}

- (NSTimeInterval)cacheTimeoutInterval {
    return  60 * 30;
}

@end
