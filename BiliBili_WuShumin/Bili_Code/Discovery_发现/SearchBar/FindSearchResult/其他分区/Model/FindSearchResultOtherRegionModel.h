//
//  FindSearchResultOtherRegionModel.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/26.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FindSearchResultOtherRegionModel : NSObject

@property (nonatomic, assign) NSString *keyword;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSMutableArray *searchResultArray;

- (void)getSearchResultWithSuccess:(void(^)(void))success failure:(void (^)(NSString *errorMsg))failure;

// 上拉加载更多
- (void)getMoreSearchResultWithSuccess:(void(^)(void))success failure:(void (^)(NSString *errorMsg))failure;

@end
