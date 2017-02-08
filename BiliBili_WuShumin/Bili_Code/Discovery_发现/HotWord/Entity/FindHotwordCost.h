//
//	FindHotwordCost.h
//
//	Create by 书敏 吴 on 5/2/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface FindHotwordCost : NSObject

@property (nonatomic, strong) NSString * readfile;
@property (nonatomic, strong) NSString * timer;
@property (nonatomic, strong) NSString * total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end