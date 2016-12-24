//
//	FindNav.h
//
//	Create by 书敏 吴 on 24/12/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface FindNav : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger pages;
@property (nonatomic, assign) NSInteger total;
@property (nonatomic, assign) NSInteger type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end