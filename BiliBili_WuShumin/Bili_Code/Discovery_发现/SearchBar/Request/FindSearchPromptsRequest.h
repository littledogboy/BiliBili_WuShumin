//
//  FindSearchPromptsRequest.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/22.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "AGBaseRequest.h"

/**
 *  搜索提示网络请求
 */
@interface FindSearchPromptsRequest : AGBaseRequest

@property (nonatomic, strong) NSString *keyword;

@end
