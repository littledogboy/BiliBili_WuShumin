//
//  FindSearchResultOtherRegionRequest.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/26.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "AGBaseRequest.h"

typedef NS_ENUM(NSInteger, RegionType) {
    RegionTypeSeasion = 1, // 番剧
    RegionTypeUP, // up
    RegionTypeMovie, // 影视
    RegionTypeSP // 专题
};

@interface FindSearchResultOtherRegionRequest : AGBaseRequest

// keyWord
@property (nonatomic, strong) NSString *keyword;

// type
@property (nonatomic, assign) RegionType type;

// ps 一页多少数据
@property (nonatomic, assign) NSInteger ps;

// pn 第几页
@property (nonatomic, assign) NSInteger pn;

@end
