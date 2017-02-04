//
//  FindSearchResultModel.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/24.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FindSearchResultRequest.h"
#import "FindData.h"

@interface FindSearchResultModel : NSObject

@property (nonatomic, strong) NSString *keyWord;

@property (nonatomic, strong) FindData *resultData;

@property (nonatomic, strong) NSMutableArray *archiveArray;

@property (nonatomic, assign) NSInteger duration; // 时长 0 1 2 3
@property (nonatomic, assign) NSString *order; // 排序方式, default(默认)， view(播放多)，pubdate（新发布）， danmaku（弹幕多）
@property (nonatomic, assign) NSInteger rid; // 区号



- (void)getSearchResultEntityWithSuccess:(void (^)(void))success failure:(void (^)(NSString *errorMsg))failure;

- (void)getMoreSearchResultEntityWithSuccess:(void (^)(void))success failure:(void (^)(NSString *eoorMsg))failure;

@end
