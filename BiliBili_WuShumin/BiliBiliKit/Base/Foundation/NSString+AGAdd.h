//
//  NSString+AGAdd.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/9/1.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AGAdd)

// 播放次数相关
/**
 *  比如： 23333 -> 2.3万 ， 666 -> 666
 *
 *  @param count 数字
 *
 *  @return 转化后的字符串
 */
+ (NSString *)stringOfCount:(NSInteger )count;

// 格林时间时间戳
+ (NSString *)tsString;

// 视频的持续时间
/**
 *  把视频时间转化为 hh：mm：ss
 *  比如：316:53 --> 05:16:53
 *
 *  @param duration 未转化的字符串
 *
 *  @return 转化后的字符串
 */
+ (NSString *)durationOfString:(NSString *)duration;

@end
