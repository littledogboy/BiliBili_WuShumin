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

@end
