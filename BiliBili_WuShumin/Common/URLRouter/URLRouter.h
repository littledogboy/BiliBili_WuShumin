//
//  URLRouter.h
//  URLRooter
//
//  Created by 吴书敏 on 16/10/9.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class URLRouterParameters;


#pragma mark- Block
/**
 *  URL 处理完成后回调
 *  result 返回数据
 */
typedef void(^URLRouterCompletion)(id result);

/**
 *  URL 是否可以打开
 */
typedef BOOL(^URLRouterCanOpenURL)(NSString *URL);

/**
 *  打开链接
 */
typedef BOOL(^URLRouterHandler)(URLRouterParameters *routerParameters);



@interface URLRouterParameters : NSObject

@property (nonatomic, strong) NSString *URL; // 跳转URL
@property (nonatomic, strong) NSDictionary *usreInfo; // 传递信息
@property (nonatomic, copy) URLRouterCompletion completion; // 执行操作

@end

// 协议
@protocol URLRouterProtocol <NSObject>

+ (BOOL)canOpenURL:(NSString *)url;

+ (BOOL)openURLWithRouterParameters:(URLRouterParameters *)parameters;

@end

@interface URLRouter : NSObject

#pragma mark- Register

+ (void)registerURLPatttern:(NSString *)URLPattern toHandel:(URLRouterHandler)handler;

+ (void)registerClass:(Class<URLRouterProtocol>)cls;

+ (void)registerKey:(NSString *)key canOpenURL:(URLRouterCanOpenURL)canOpenURL toHandler:(URLRouterHandler)handler;

#pragma mark- UnRegister 

+ (void)unregisterURLPattern:(NSString *)URLPattern;

+ (void)unregisterClass:(Class<URLRouterProtocol>)cls;

+ (void)unregisterWithKey:(NSString *)key;

#pragma mark- OpenURL

+ (BOOL)openURL:(NSString *)URL;

+ (BOOL)openURL:(NSString *)URL withUserInfo:(NSDictionary *)userInfo;

+ (BOOL)openURL:(NSString *)URL completion:(URLRouterCompletion)completion;

+ (BOOL)openURL:(NSString *)URL withUserInfo:(NSDictionary *)userInfo completion:(URLRouterCompletion)completion;

@end

