//
//  AGRequestHandler.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/17.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AGRequest;

// 网络请求方式
typedef NS_ENUM(NSInteger, HTTPMethod) {
    HTTPMethodGet,
    HTTPMethodPost,
};

// 网络连接状态
typedef NS_ENUM(NSInteger, NetworkReachabilityStatus) {
    NetworkReachabilityStatusUnknown          = -1, // 未知
    NetworkReachabilityStatusNotReachable     = 0, // 无连接
    NetworkReachabilityStatusReachableViaWWAN = 1, // 3g,4g
    NetworkReachabilityStatusReachableViaWiFi = 2, // wifi
};

// 协议
@protocol AGRequestHandlerDelegate <NSObject>

- (void)requestHandlerResponseObject:(id)responseObject; // 响应
- (void)requestHandlerError:(NSError *)error; // 出错

@end

@interface AGRequestHandler : NSObject

@property (nonatomic, assign, readonly) NetworkReachabilityStatus networkReachabilityStatus; // 网络连接状态
@property (nonatomic, assign) NSTimeInterval timeoutInterval; // 网络超时时间
@property (nonatomic, strong) NSString *baseURLString; // 网络连接

+ (AGRequestHandler *)sharedInstance; // 单例类方法

- (NSURLSessionDataTask *)sendRequest:(AGRequest *)request;

- (NSURLSessionDataTask *)sendRequestWithURLString:(NSString *)URLString
                                            Method:(HTTPMethod )method
                                        parameters:(id)parameters
                                          delegate:(id<AGRequestHandlerDelegate>)delegate;

@end













