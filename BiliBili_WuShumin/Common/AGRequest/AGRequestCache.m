//
//  AGRequestCache.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/17.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "AGRequestCache.h"
#import "AGRequest.h"

@implementation AGRequestCache

+ (AGRequestCache *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // 在 Cache/AGrequestCache 路径下 创建文件夹
        NSString *cachesDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        _diskPath = [cachesDirectory stringByAppendingPathComponent:@"AGRequestCache"];
        [[NSFileManager defaultManager] createDirectoryAtPath:_diskPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return self;
}


- (NSString *)cachedPathForRequest:(AGRequest *)request {
    return [NSString stringWithFormat:@"%@/%@/%@", _diskPath, request.groupName, request.identifier];
}

#pragma mark- request

- (void)storeCachedJSONObjectForRequest:(AGRequest *)request {
    // 获取 请求的 json 二进制数据
    NSData *cacheData = [NSJSONSerialization dataWithJSONObject:request.responseObject options:kNilOptions error:nil];
    [self storeCachedData:cacheData ForPath:[self cachedPathForRequest:request]];
}

- (NSObject *)cachedJSONObjectForRequest:(AGRequest *)request isTimeout:(BOOL *)isTimeout {
    NSData *cachedData = [self cachedDataForPath:[self cachedPathForRequest:request] timeoutInterval:request.cacheTimeoutInterval isTimeout:isTimeout];
    if (cachedData) {
        return [NSJSONSerialization JSONObjectWithData:cachedData options:0 error:nil];
    } else {
        return nil;
    }
}

- (void)removeCachedJSONObjectForRequest:(AGRequest *)request {
    [self removeCachedJSONObjectForPath:[self cachedPathForRequest:request]];
}

#pragma mark- path

- (void)storeCachedData:(NSData *)cacheData ForPath:(NSString *)path {
    if (cacheData == NULL) {
        [self removeCachedJSONObjectForPath:path];
        return;
    }
    
    NSString *directoryPath = [path stringByDeletingLastPathComponent];
    BOOL isDirectory = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    if (!isDirectory) {
        [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    [cacheData writeToFile:path atomically:YES];
}

- (NSData *)cachedDataForPath:(NSString *)path timeoutInterval:(NSTimeInterval)timeoutInterval isTimeout:(BOOL *)isTimeout {
    if (path.length == 0) {
        return nil;
    }
    NSData *cachedData = [[NSData alloc] initWithContentsOfFile:path];
    if (!cachedData) {
        return nil;
    }
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    NSDictionary *fileAttributes = [[NSFileManager defaultManager] fileAttributesAtPath:path traverseLink:true];
#pragma clang diagnostic pop
    NSDate *fileModificationDate = [fileAttributes valueForKey:NSFileModificationDate];
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:fileModificationDate];
    *isTimeout = (timeInterval  > timeInterval);
    return cachedData;
}

- (void)removeCachedJSONObjectForPath:(NSString *)path {
    if (path.length == 0) {
        return;
    }
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

#pragma mark- move
- (void)removeAllCachedData {
    [[NSFileManager defaultManager] removeItemAtPath:_diskPath error:nil];
}

@end
