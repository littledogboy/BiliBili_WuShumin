//
//	BungumiRootClass.h
//
//	Create by 书敏 吴 on 14/10/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "BungumiResult.h"

@interface BungumiRootClass : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, strong) BungumiResult * result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end