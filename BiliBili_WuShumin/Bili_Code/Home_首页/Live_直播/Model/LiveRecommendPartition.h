//
//	LiveRecommendPartition.h
//
//	Create by 书敏 吴 on 27/10/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "LiveRecommendSubIcon.h"

@interface LiveRecommendPartition : NSObject

@property (nonatomic, strong) NSString * area;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) LiveRecommendSubIcon * subIcon;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end