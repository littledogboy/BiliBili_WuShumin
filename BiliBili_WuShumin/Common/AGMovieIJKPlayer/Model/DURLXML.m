//
//  DURLXML.m
//  XML解析
//
//  Created by 吴书敏 on 16/9/19.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "DURLXML.h"

@implementation DURLXML

- (instancetype)init {
    self = [super init];
    if (self == nil) return nil;
    
    self.urls = [NSMutableArray arrayWithCapacity:2];
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"order"]) {
        self.order = [value integerValue];
    } else if ([key isEqualToString:@"length"]) {
        self.length = [value integerValue];
    } else if ([key isEqualToString:@"size"]) {
        self.size = [value integerValue];
    }
    
    if ([key isEqualToString:@"url"]) {
        NSURL *url = [NSURL URLWithString:value];
        [self.urls addObject:url];
    }
}

@end
