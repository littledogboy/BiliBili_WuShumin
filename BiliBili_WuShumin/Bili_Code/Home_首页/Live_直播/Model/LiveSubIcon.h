//
//	LiveSubIcon.h
//
//	Create by 书敏 吴 on 28/10/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface LiveSubIcon : NSObject

@property (nonatomic, strong) NSString * height;
@property (nonatomic, strong) NSString * src;
@property (nonatomic, strong) NSString * width;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end