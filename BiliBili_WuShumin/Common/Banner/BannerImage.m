//
//  BannerImage.m
//  AGCircularScrollView
//
//  Created by 吴书敏 on 16/2/25.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "BannerImage.h"

@implementation BannerImage


- (void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    
    if ([key isEqualToString:@"type"]) {
        self.type = [value intValue];
    }
}

//
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    // nil
}

@end
