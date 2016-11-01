//
//	LiveRecommendRootClass.h
//
//	Create by 书敏 吴 on 27/10/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "LiveRecommendData.h"

@interface LiveRecommendRootClass : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) LiveRecommendData * data;
@property (nonatomic, strong) NSString * message;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end