//
//	BungumiResult.h
//
//	Create by 书敏 吴 on 14/10/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "BungumiAd.h"
#import "BungumiPreviou.h"
#import "BungumiSerializing.h"

@interface BungumiResult : NSObject

@property (nonatomic, strong) BungumiAd * ad;
@property (nonatomic, strong) BungumiPreviou * previous;
@property (nonatomic, strong) NSArray * serializing;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end