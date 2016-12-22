//
//  AGBaseRequest.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/17.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "AGRequest.h"

@interface AGBaseRequest : AGRequest

@property (nonatomic, assign, readonly) NSInteger responseCode;

@property (nonatomic, strong, readonly) id responseData;

@property (nonatomic, strong, readonly) NSString *errorMsg;

- (void)startWithCompletionBlock:(void (^)(AGBaseRequest *request))completionBlock;

@end
