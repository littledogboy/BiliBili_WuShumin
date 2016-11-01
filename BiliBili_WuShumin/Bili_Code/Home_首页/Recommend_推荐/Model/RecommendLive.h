//
//	RecommendLive.h
//
//	Create by 书敏 吴 on 31/10/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface RecommendLive : NSObject

@property (nonatomic, strong) NSString * area;
@property (nonatomic, assign) NSInteger areaId;
@property (nonatomic, strong) NSString * cover;
@property (nonatomic, strong) NSString * face;
@property (nonatomic, strong) NSString * gotoField;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger online;
@property (nonatomic, strong) NSString * param;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * uri;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end