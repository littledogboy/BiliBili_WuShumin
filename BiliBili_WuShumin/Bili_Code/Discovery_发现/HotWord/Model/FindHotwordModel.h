//
//  FindHotwordModel.h
//  AGTagListView
//
//  Created by 吴书敏 on 17/2/5.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FindHotwordEntity.h"

@interface FindHotwordModel : NSObject

@property (nonatomic, strong) NSArray<FindHotwordList *> *listArray;

- (void)getHotWordEntityWithSuccess:(void(^)(void))success failure:(void(^)(NSString *msg))failure;

@end
