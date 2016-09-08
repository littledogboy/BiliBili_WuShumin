//
//  AGHTTPURLHandle.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/9/6.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "AGHTTPURLHandle.h"
#import "AFNetworking.h"

@implementation AGHTTPURLHandle

+ (void)GET:(NSString *)URLString success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure {
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manger GET:URLString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task, error);
    }];
}

@end
