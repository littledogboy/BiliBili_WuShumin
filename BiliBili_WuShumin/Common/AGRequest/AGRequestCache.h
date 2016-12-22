//
//  AGRequestCache.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/17.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AGRequest;

@interface AGRequestCache : NSObject

@property (nonatomic, strong) NSString *diskPath;

+ (AGRequestCache *)sharedInstance;

// 读写，移除 request 缓存
- (void)storeCachedJSONObjectForRequest:(AGRequest *)request;

- (NSObject *)cachedJSONObjectForRequest:(AGRequest *)request isTimeout:(BOOL *)isTimeout;

- (void)removeCachedJSONObjectForRequest:(AGRequest *)request;

// 读写，移除 path 缓存
- (void)storeCachedData:(NSData *)cacheData ForPath:(NSString *)path;

- (NSData *)cachedDataForPath:(NSString *)path timeoutInterval:(NSTimeInterval)timeoutInterval isTimeout:(BOOL *)isTimeout;

- (void)removeCachedJSONObjectForPath:(NSString *)path;

// 移除所有缓存
- (void)removeAllCachedData;

@end
