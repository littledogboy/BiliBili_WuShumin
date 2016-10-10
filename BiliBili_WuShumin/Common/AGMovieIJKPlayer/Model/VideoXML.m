//
//  VideoXML.m
//  XML解析
//
//  Created by 吴书敏 on 16/9/19.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "VideoXML.h"

@implementation VideoXML

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    // 防止崩溃
}

- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
    
    if ([key isEqualToString:@"timelength"]) {
        self.timelength = [value integerValue];
    }
    
    if ([key isEqualToString:@"durl"]) {
        self.durl = [[DURLXML alloc] init];
    }
    
    if (self.durl != nil) {
        [self.durl setValue:value forKey:key];
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %ld %@ %@ %@ %@ %@ %@ %@", _result, _timelength, _format, _accept_format, _accept_quality, _from, _seek_param, _seek_type, _durl];
}

@end
