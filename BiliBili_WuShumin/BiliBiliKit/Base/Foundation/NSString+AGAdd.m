//
//  NSString+AGAdd.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/9/1.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "NSString+AGAdd.h"

@implementation NSString (AGAdd)

+ (NSString *)stringOfCount:(NSInteger)count {
    float floatCount = 0.0f;
    if (count >= 10000) {
        floatCount = count / 10000.0;
        return [NSString stringWithFormat:@"%.1f万", floatCount];
    } else {
        return [NSString stringWithFormat:@"%ld", count];
    }
}

+ (NSString *)tsString {
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    NSString *tsInterval = [NSString stringWithFormat:@"%10.0f", interval];
    return tsInterval;
}

// 316:52 ---> 05:16:53
// 3600:52 ---> 01:00:00:53
+ (NSString *)durationOfString:(NSString *)duration{
    NSArray *array = [duration componentsSeparatedByString:@":"];
    NSMutableArray *numberArray = [NSMutableArray array];
    
    for (NSString *string in array) {
        NSInteger count = [string integerValue];
        NSInteger result = count / 60; // 商
        NSInteger remainder = count % 60; // 余数
        NSInteger temp = result; // temp 容器
        if (result < 60 && result != 0) { // 如果商小于等于 60，添加商
            [numberArray insertObject:@(result) atIndex:0];
        }
        [numberArray addObject:@(remainder)]; // 添加余数

        while ( temp >= 60) {
            result = temp / 60;
            remainder = temp % 60;
            temp = result;
            if (result < 60 && result != 0) {
                [numberArray insertObject:@(result) atIndex:0];
                [numberArray insertObject:@(remainder) atIndex:[numberArray indexOfObject:@(result)] + 1];
            } else {
                [numberArray insertObject:@(remainder) atIndex:0];
            }
        }
    }
    
    //
    NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:numberArray.count];
    [numberArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSInteger number = ((NSNumber *)numberArray[idx]).integerValue;
        NSString *numberStr = [NSString stringWithFormat:@"%lu", number];
        if (number < 10) {
            numberStr = [NSString stringWithFormat:@"0%lu", number];
        }
        [newArray addObject:numberStr];
    }];
    
    return [newArray componentsJoinedByString:@":"];
}

@end
