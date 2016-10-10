//
//  VideoXML.h
//  XML解析
//
//  Created by 吴书敏 on 16/9/19.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DURLXML.h"

@interface VideoXML : NSObject

@property (nonatomic, strong) NSString  *result;
@property (nonatomic, assign) NSInteger timelength;
@property (nonatomic, strong) NSString  *format;
@property (nonatomic, strong) NSString  *accept_format;
@property (nonatomic, strong) NSString  *accept_quality;
@property (nonatomic, strong) NSString  *from;
@property (nonatomic, strong) NSString  *seek_param;
@property (nonatomic, strong) NSString  *seek_type;
@property (nonatomic, strong) DURLXML   *durl;

@end
