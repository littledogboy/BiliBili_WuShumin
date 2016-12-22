//
//  AGRequest.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/17.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AGRequestHandler.h"
@class AGRequest;

// 代理传值方式，把 request 传递给外界
@protocol AGRequestDelegate <NSObject>

- (void)requestCompletion:(AGRequest *)request; 

@end

@interface AGRequest : NSObject <AGRequestHandlerDelegate>

@property (nonatomic, strong) NSString *URLString;
@property (nonatomic, assign) HTTPMethod method;
@property (nonatomic, strong) NSObject *parameters;

#pragma mark- Cache

@property (nonatomic, assign) NSTimeInterval cacheTimeoutInterval;
@property (nonatomic, strong) NSString *groupName;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, assign) BOOL mustFromNetwork;
@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, assign, readonly) NSURLSessionTaskState state;
@property (nonatomic, strong, readonly) id responseObject;
@property (nonatomic, strong, readonly) NSError *error;

@property (nonatomic, weak) id<AGRequestDelegate> delegate;

@property (nonatomic, copy) void (^completionBlock)(__kindof AGRequest *request);

+ (instancetype)request;

// delegate 方式
- (__kindof AGRequest *)startWithDelegate:(id<AGRequestDelegate>)delegate;

// block 方式
- (__kindof AGRequest *)startWithCompletionBlock:(void (^)(__kindof AGRequest *request))completionBlock;
- (__kindof AGRequest *)start;

- (void)pause;

- (void)stop;
@end







