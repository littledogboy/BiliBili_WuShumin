//
//  NSString+AGMovieTime.h
//  AGMovieIJKPlayer
//
//  Created by 吴书敏 on 16/9/24.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface NSString (AGMovieTime)

// 播放器时间转换
+ (NSString *)convertTime:(CGFloat)second;

@end
