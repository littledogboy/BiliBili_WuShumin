//
//  URLRouter.m
//  URLRooter
//
//  Created by 吴书敏 on 16/10/9.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "URLRouter.h"

#import "UIViewController+AGGetViewController.h"


@interface URLRoute : NSObject

@property (nonatomic, strong) NSString *key;
@property (nonatomic, copy) URLRouterCanOpenURL canOpenURL;
@property (nonatomic, copy) URLRouterHandler handler;

@end



@implementation URLRoute

+ (instancetype)routeWithKey:(NSString *)key
                  canOpenURL:(URLRouterCanOpenURL)canopenURL
                     handler:(URLRouterHandler)handler {
    URLRoute *route = [[URLRoute alloc] init];
    route.key = key;
    route.canOpenURL = canopenURL;
    route.handler = handler;
    return route;
}

@end


@implementation URLRouterParameters

+ (instancetype)parametersWithURL:(NSString *)URL
       withUserInfo:(NSDictionary *)userInfo
         completion:(URLRouterCompletion)completion {
    URLRouterParameters *parameters = [[URLRouterParameters alloc] init];
    parameters.URL = URL;
    parameters.usreInfo = userInfo;
    parameters.completion = completion;
    return parameters;
}

@end


@interface URLRouter ()

@property (nonatomic, strong) NSMutableArray<URLRoute *> *routes;

@end


@implementation URLRouter

// 单例
+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _routes = [NSMutableArray array];
    }
    return self;
}

#pragma mark- Register 注册

+ (void)registerURLPatttern:(NSString *)URLPattern toHandel:(URLRouterHandler)handler {
    
    URLRouterCanOpenURL canOpenURL = ^BOOL(NSString *URL) {
        return [URL rangeOfString:URLPattern].length > 0;
    };
    [self registerKey:URLPattern canOpenURL:canOpenURL toHandler:handler];
}

+ (void)registerClass:(Class<URLRouterProtocol>)cls {
    URLRouterCanOpenURL canOpenURL = ^BOOL(NSString *URL) {
        return [cls canOpenURL:URL]; // 执行协议方法
    };
    URLRouterHandler handler = ^BOOL(URLRouterParameters *routerParameters) {
        return [cls openURLWithRouterParameters:routerParameters]; // 执行协议方法
    };
    [self registerKey:NSStringFromClass(cls) canOpenURL:canOpenURL toHandler:handler];
}

// key 标识符
// canOpenURL 打开规则（是否可以打开）
// handler    打开URL (跳转操作)
// 内部操作，创建 URLRoute 存储 key值，是否可打开，跳转操作
+ (void)registerKey:(NSString *)key canOpenURL:(URLRouterCanOpenURL)canOpenURL toHandler:(URLRouterHandler)handler {
    // 如有替换
    // key： pattern cls
    for (URLRoute  *route in [URLRouter sharedInstance].routes) {
        if ([route.key isEqualToString:@"key"]) {
            route.canOpenURL = canOpenURL;
            route.handler = handler;
            return;
        }
    }
    // 否则加入 routes 中
    [[URLRouter sharedInstance].routes addObject:[URLRoute routeWithKey:key canOpenURL:canOpenURL handler:handler]];
}


#pragma mark- Unregister 注销

+ (void)unregisterURLPattern:(NSString *)URLPattern {
    [self unregisterWithKey:URLPattern];
}

+ (void)unregisterClass:(Class<URLRouterProtocol>)cls {
    [self unregisterWithKey:NSStringFromClass(cls)];
}

+ (void)unregisterWithKey:(NSString *)key {
    [[URLRouter sharedInstance].routes enumerateObjectsUsingBlock:^(URLRoute * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.key isEqualToString:key]) {
            [[URLRouter sharedInstance].routes removeObjectAtIndex:idx];
            *stop = YES; // 停止
        }
    }];
}

#pragma mark- OpenURL 打开

+ (BOOL)openURL:(NSString *)URL {
    return [self openURL:URL withUserInfo:nil completion:nil];
}

+ (BOOL)openURL:(NSString *)URL withUserInfo:(NSDictionary *)userInfo {
    return [self openURL:URL withUserInfo:userInfo completion:nil];
}

+ (BOOL)openURL:(NSString *)URL completion:(URLRouterCompletion)completion {
    return [self openURL:URL withUserInfo:nil completion:completion];
}

+ (BOOL)openURL:(NSString *)URL withUserInfo:(NSDictionary *)userInfo completion:(URLRouterCompletion)completion {
    for (URLRoute *route in [URLRouter sharedInstance].routes) {
        // 以route.canOpenURL 作为判断条件，遍历的时候 url 匹配对应的 route
        // 比如： bilibii://video/ 传 bilibii://video/8080 匹配 video对应的 route
        // 如果是 bilibii://live/8080 则匹配 live 的route
        if (route.canOpenURL) { // canOpenURL 两种，一种Pattern，一种协议方法
            URLRouterParameters *paremeters = [URLRouterParameters parametersWithURL:URL withUserInfo:userInfo completion:completion];
            // handler 两种， 一种外界给定， 一种协议方法
            // block 解耦
            if (route.handler(paremeters)) {
                return YES;
            }
        }
    }
    
    return NO;
}
@end
















