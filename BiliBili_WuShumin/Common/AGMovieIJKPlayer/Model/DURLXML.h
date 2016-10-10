//
//  DURLXML.h
//  XML解析
//
//  Created by 吴书敏 on 16/9/19.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DURLXML : NSObject

@property (nonatomic, assign) NSInteger      order;
@property (nonatomic, assign) NSInteger      length;
@property (nonatomic, assign) NSInteger      size;
@property (nonatomic, strong) NSMutableArray *urls;

@end
