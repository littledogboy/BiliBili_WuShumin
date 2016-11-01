//
//	LiveRecommendCover.h
//
//	Create by 书敏 吴 on 27/10/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface LiveRecommendCover : NSObject

@property (nonatomic, assign) NSInteger height;
@property (nonatomic, strong) NSString * src;
@property (nonatomic, assign) NSInteger width;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end