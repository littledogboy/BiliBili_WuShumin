//
//	FindHotwordEntity.h
//
//	Create by 书敏 吴 on 5/2/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "FindHotwordCost.h"
#import "FindHotwordList.h"

@interface FindHotwordEntity : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) FindHotwordCost * cost;
@property (nonatomic, strong) NSArray * list;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, strong) NSString * seid;
@property (nonatomic, assign) NSInteger timestamp;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end