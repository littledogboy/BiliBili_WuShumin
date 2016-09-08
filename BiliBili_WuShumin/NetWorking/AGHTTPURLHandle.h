//
//  AGHTTPURLHandle.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/9/6.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGHTTPURLHandle : NSObject

+ (void)GET:(NSString *)URLString
    success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
    failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;



@end
