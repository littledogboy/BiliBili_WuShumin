//
//	LiveRecommendData.h
//
//	Create by 书敏 吴 on 27/10/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "LiveRecommendRecommendData.h"

@interface LiveRecommendData : NSObject

@property (nonatomic, strong) LiveRecommendRecommendData * recommendData;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end