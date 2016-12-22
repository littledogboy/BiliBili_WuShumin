//
//  AGRequestHandler.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/17.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "AGRequestHandler.h"
#import <AFNetworking.h> // 基于 afn 的再次封装
#import "AGResponseSerializer.h"
#import "AGRequest.h"

@interface AGRequestHandler ()

@property (nonatomic, strong, nonnull) AFHTTPSessionManager *HTTPSessionManager;

@end

@implementation AGRequestHandler

+ (AGRequestHandler *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

// 关键看看 init 里面做了什么事
/*
    1. 创建 sessionManage
    2. 设置 reponseSerializer ，返回格式
    3. requestSerializer 设置查询语句
 */
- (instancetype)init {
    self = [super init];
    if (self) {
        self.HTTPSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:NULL sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        // 自己设置相应格式
        self.HTTPSessionManager.responseSerializer = [AGResponseSerializer serializer];
        // 自己组装请求参数
        [self.HTTPSessionManager.requestSerializer setQueryStringSerializationWithBlock:^NSString * _Nonnull(NSURLRequest * _Nonnull request, id  _Nonnull parameters, NSError * _Nullable __autoreleasing * _Nullable error) {
            // 返回一个 串行url查询字符串
            return [[AGRequestHandler sharedInstance] queryStringSerialization:request parameters:parameters error:error];
        }];
    }
    return self;
}

- (NSURLSessionDataTask *)sendRequest:(AGRequest *)request {
    return [self sendRequestWithURLString:request.URLString Method:request.method parameters:request.parameters delegate:request];
}


- (NSURLSessionDataTask *)sendRequestWithURLString:(NSString *)URLString Method:(HTTPMethod)method parameters:(id)parameters delegate:(id<AGRequestHandlerDelegate>)delegate {
    if (![URLString hasPrefix:@"http"]) {
        URLString = [_baseURLString stringByAppendingPathComponent:URLString]; // 不用加 /
    }
    
    if (method == HTTPMethodGet) {
        return [_HTTPSessionManager GET:URLString parameters:parameters progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            // 返回结果让 delegate 处理
            [delegate requestHandlerResponseObject:responseObject];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [delegate requestHandlerError:error];
        }];
    } else if (method == HTTPMethodPost) {
        return [_HTTPSessionManager POST:URLString parameters:parameters progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [delegate requestHandlerResponseObject:responseObject];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [delegate requestHandlerError:error];
        }];
    } else {
        return NULL;
    }
}

// get 获取网络状态
- (NetworkReachabilityStatus )networkReachabilityStatus {
    return (NetworkReachabilityStatus)[AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
}

// 设置 链接超时时间
- (void)setTimeoutInterval:(NSTimeInterval)timeoutInterval {
    _timeoutInterval = timeoutInterval;
    _HTTPSessionManager.requestSerializer.timeoutInterval = _timeoutInterval;
}

- (NSString *)queryStringSerialization:(NSURLRequest *)request parameters:(id)parameters error:(NSError *__autoreleasing *)error {
    // 创建一个 block 把字典 -> 数组， 数组中元素格式为 key = keyValue
    NSArray *(^parametersToArray)(NSDictionary *dictionary) = ^(NSDictionary *dictionary) {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:dictionary.count];
        for (NSObject *key in dictionary.allKeys) {
            [array addObject:[NSString stringWithFormat:@"%@=%@", key, [dictionary objectForKey:key]]];
        }
        return [NSArray arrayWithArray:array];
    };
    
    // 创建一个 block  把 数组元素拼接为字符串 分割符 &
    NSString *(^parametersToString)(NSArray *array) = ^(NSArray *array) {
        return [array componentsJoinedByString:@"&"];
    };
    
    if([parameters isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = parameters;
        if(dict.count == 0) {
            return NULL;
        }
        // 先转化为 url 参数数组，然后再转化为 & 分割的字符串
        return parametersToString(parametersToArray(parameters));
    } else if ([parameters isKindOfClass:[NSArray class]]) {
        NSArray *array = parameters;
        if (array.count == 0) {
            return NULL;
        }
        return parametersToString(parameters);
    } else if ([parameters isKindOfClass:[NSString class]]) {
        return parameters;
    } else {
        return NULL;
    }
}

@end
