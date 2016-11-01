//
//	Live.h
//
//	Create by 书敏 吴 on 27/10/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "LiveCover.h"
#import "LiveOwner.h"

@interface Live : NSObject

@property (nonatomic, strong) NSString * acceptQuality;
@property (nonatomic, strong) NSString * area;
@property (nonatomic, assign) NSInteger areaId;
@property (nonatomic, assign) NSInteger broadcastType;
@property (nonatomic, assign) NSInteger checkVersion;
@property (nonatomic, strong) LiveCover * cover;
@property (nonatomic, assign) NSInteger isTv;
@property (nonatomic, assign) NSInteger online;
@property (nonatomic, strong) LiveOwner * owner;
@property (nonatomic, strong) NSString * playurl;
@property (nonatomic, assign) NSInteger roomId;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end