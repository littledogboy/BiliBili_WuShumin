//
//  FindSearchResultRequest.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/24.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "AGBaseRequest.h"
#import "FindSearchResultRequestMacro.h"

@interface FindSearchResultRequest : AGBaseRequest

@property (nonatomic, strong) NSString *keyword;
@property (nonatomic, assign) NSInteger duration; // 时长
@property (nonatomic, assign) NSString *order; // 排序方式, default(默认)， view(播放多)，pubdate（新发布）， danmaku（弹幕多）
@property (nonatomic, assign) NSInteger pn; // 第几页
@property (nonatomic, assign) NSInteger ps; // 每页显示多少
@property (nonatomic, assign) NSInteger rid; // 区号

@end
