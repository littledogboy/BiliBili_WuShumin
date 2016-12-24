//
//  FindSearchResultModel.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/24.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FindData;

@interface FindSearchResultModel : NSObject

@property (nonatomic, strong) NSString *keyWord;

@property (nonatomic, strong) FindData *resultData;

- (void)getSearchResultEntityWithSuccess:(void (^)(void))success failure:(void (^)(NSString *errorMsg))failure;

@end
