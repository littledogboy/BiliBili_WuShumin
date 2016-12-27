//
//  FindSearchResultOtherRegionModel.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/26.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "FindSearchResultOtherRegionModel.h"
#import "FindSearchResultOtherRegionRequest.h"
#import "FindSeason.h"
#import "FindUP.h"
#import "FindMovie.h"
#import "FindSP.h"

@interface FindSearchResultOtherRegionModel ()

@property (nonatomic, strong) FindSearchResultOtherRegionRequest *otherRegionRequest;
@property (nonatomic, assign) NSInteger pages; // 最大页数

@end

@implementation FindSearchResultOtherRegionModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _pages = INTMAX_MAX;
        self.otherRegionRequest = [[FindSearchResultOtherRegionRequest alloc] init];
        _otherRegionRequest.pn = 0;
        _otherRegionRequest.ps = 20;
        _otherRegionRequest.type = RegionTypeSeasion; // type 默认为1
        
    }
    return self;
}

- (void)setType:(NSInteger)type {
    _type = type;
    _otherRegionRequest.type = type;
}

- (void)setKeyword:(NSString *)keyword {
    _keyword = keyword;
    _otherRegionRequest.keyword = keyword;
}

- (void)getSearchResultWithSuccess:(void (^)(void))success failure:(void (^)(NSString *))failure {
    [_otherRegionRequest stop];
    _otherRegionRequest.pn = 0;
    self.searchResultArray = [NSMutableArray  array];
    
    [self getMoreSearchResultWithSuccess:success failure:failure];
}

- (void)getMoreSearchResultWithSuccess:(void (^)(void))success failure:(void (^)(NSString *))failure {
    _otherRegionRequest.pn++; // 页数+1, pn从1开始
    // 如果数组中没有数据 且 pn > 最大页数 返回
    if (_searchResultArray.count % _otherRegionRequest.ps && _otherRegionRequest.pn > _pages) {
        return ;
    }
    //
    [_otherRegionRequest startWithCompletionBlock:^(AGBaseRequest *request) {
        if (request.responseCode == 0) {
            self.pages = [[request.responseData objectForKey:@"pages"] integerValue];
            NSArray *itemsArray = [request.responseData objectForKey:@"items"];
            for (NSDictionary *items in itemsArray) {
                switch (_type) {
                    case RegionTypeSeasion:
                    {
                        FindSeason *season = [[FindSeason alloc] initWithDictionary:items];
                        [self.searchResultArray addObject:season];
                    }
                        break;
                        
                    case RegionTypeUP:
                    {
                        FindUP *up = [[FindUP alloc] initWithDictionary:items];
                        [self.searchResultArray addObject:up];
                    }
                        break;
                        
                    case RegionTypeMovie:
                    {
                        FindMovie *movie = [[FindMovie alloc] initWithDictionary:items];
                        [self.searchResultArray addObject:movie];
                    }
                        break;
                        
                    case RegionTypeSP:
                    {
                        FindSP *sp = [[FindSP alloc] initWithDictionary:items];
                        [self.searchResultArray addObject:sp];
                    }
                        break;
                        
                    default:
                        break;
                }
            }
            success();
        } else {
            if (failure) {
                failure(request.errorMsg);
            }
        }
    }];
}

@end
