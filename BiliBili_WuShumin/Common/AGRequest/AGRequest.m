//
//  AGRequest.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/17.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "AGRequest.h"
#import "AGRequestHandler.h"
#import "AGRequestCache.h"
#import <CommonCrypto/CommonDigest.h> 

// md5 加密
NSString *MD5(NSString *str) {
    const char *cStr = [str UTF8String];
    unsigned char digst[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (unsigned int)strlen(cStr), digst);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digst[i]];
    }
    return output;
}


@interface AGRequest ()

@property (nonatomic, strong) NSURLSessionTask *task;

@end


@implementation AGRequest

+ (instancetype)request {
    return [[self alloc] init];
}

- (AGRequest *)startWithDelegate:(id<AGRequestDelegate>)delegate {
    _delegate = delegate;
    return [self start];
}

- (AGRequest *)startWithCompletionBlock:(void (^)(__kindof AGRequest *))completionBlock {
    _completionBlock = completionBlock;
    return [self start];
}

#pragma mark- start 开始网络请求
- (AGRequest *)start {
    // 如果task 不为空， 且 正在运行，或者挂起
    if (self.task && (self.state == NSURLSessionTaskStateRunning ||
                      self.state == NSURLSessionTaskStateSuspended)) {
        [self.task cancel]; // 取消
    }
    
    _responseObject = NULL;
    _error = NULL;
    _task = NULL;
    
    // 如果不是从网络获取， 且 有缓存
    if (!_mustFromNetwork && [self readCache]) {
        [self.delegate requestCompletion:self];
        _completionBlock ? _completionBlock(self) : NULL;
        _completionBlock = NULL;
    } else {
        [self dynamicURLStringWithCallback:^(NSString *URLString, id parameters) {
            _task = [[AGRequestHandler sharedInstance] sendRequestWithURLString:URLString Method:self.method parameters:parameters delegate:self];
        }];
    }
    
    return self;
}

- (void)pause {
    [self.task suspend]; // 暂停
}

- (void)stop {
    _completionBlock = NULL;
    [self.task cancel]; // 取消，不可恢复
}

- (NSURLSessionTaskState)state {
    return _task.state;
}

#pragma mark- RequestHandlerDelegate

- (void)requestHandlerResponseObject:(id)responseObject {
    _responseObject = responseObject;
    
    [self storeCache];
    [self.delegate requestCompletion:self]; // 代理传值
    _completionBlock ? _completionBlock(self) : NULL; // block 传值
    _completionBlock = NULL;
}

- (void)requestHandlerError:(NSError *)error {
    _error = error;
    [self.delegate requestCompletion:self]; // 代理传值
    _completionBlock ? _completionBlock(self) : NULL; // block 传值
    _completionBlock = NULL;
}

#pragma mark- Cache

- (NSString *)groupName {
    return MD5(self.URLString); // MD5 加密 URLString
}

- (NSString *)identifier {
    if (self.parameters) {
        return MD5(self.parameters.description); // 默认类名 和 对象内存地址
    } else {
        return self.groupName;
    }
}

// 写入缓存
- (void)storeCache {
    if (self.cacheTimeoutInterval <= 0 || !_responseObject || ![self willStoreCache]) {
        return;
    }
    [[AGRequestCache sharedInstance] storeCachedJSONObjectForRequest:self];
}

// 读取缓存
- (BOOL)readCache {
    if (self.cacheTimeoutInterval <= 0) {
        return NO;
    }
    BOOL isTimeout;
    // 读取缓存对象
    id cacheJSONObject = [[AGRequestCache sharedInstance] cachedJSONObjectForRequest:self isTimeout:&isTimeout];
    if (cacheJSONObject && !isTimeout) { // 如果 object 不为空，且 没有超时
        _responseObject = cacheJSONObject;
        return YES;
    } else {
        return NO;
    }
}

- (void)willResume {}

- (void)willReadCache {}

- (BOOL)didReadCache {return  YES;}

- (void)completed {}

- (void)success {}

- (void)failure {}

- (BOOL)willStoreCache {return YES;}

#pragma mark- tool

// 动态回调 urlString callBackBlock
- (void)dynamicURLStringWithCallback:(void (^)(NSString *URLString, id parameters))callback {
    
    // 如果 urlSting 中没有 ##
    if ([self.URLString rangeOfString:@"##"].length <= 0) {
        callback ? callback(self.URLString, self.parameters) : NULL;
        return;
    }
    // 如果 parameter 不是 字典
    if (![self.parameters isKindOfClass:[NSDictionary class]]) {
        callback ? callback(self.URLString, self.parameters) : NULL;
        return;
    }
    
    // 如果 parameters 没有元素
    NSDictionary *parameters = (NSDictionary *)self.parameters;
    if (parameters.count == 0) {
        callback ? callback(self.URLString, self.parameters) : NULL;
        return;
    }
    
    // 取## 参数 ## 格式的参数数组
    NSMutableArray<NSString *> *parameterNames = [NSMutableArray array];
    NSRange range = NSMakeRange(0, self.URLString.length); // url长度
    NSInteger start = -1;
    
    while (YES) {
        range = [self.URLString rangeOfString:@"##" options:NSCaseInsensitiveSearch range:range]; // 不区分大小写比较
        if (range.length > 0) { // 如果包含 ##
            if (start == -1) { // 如果 从 -1 开始
                start = range.location + range.length; // start 至为参数末尾
            } else { // 如果不是从 -1 开始
                [parameterNames addObject:[self.URLString substringWithRange:NSMakeRange(start, range.location - start)]]; // -length 取参数
            }
        } else { // 如果 urlString 不包含 ## 格式
            break;
            
        }
    }
    
    if (parameterNames.count == 0) {
        callback ? callback(self.URLString, self.parameters) : NULL;
        return;
    }
    
    // 如果 parameterNames count 不为 0
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    NSString *URLString = self.URLString;
    
    for (NSString *key in parameters.allKeys) { // 参数名
        for (NSString *name in parameterNames) { // 参数
            // 替换 urlString 中的 参数格式
            URLString = [URLString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"##%@##", name] withString:[NSString stringWithFormat:@"%@", [parameters objectForKey:key]]];
            [mutableParameters removeObjectForKey:key];
        }
    }
    
    // 替换完毕
    callback ? callback(URLString, (mutableParameters.count ? mutableParameters :NULL)) : NULL;
    
}

@end









