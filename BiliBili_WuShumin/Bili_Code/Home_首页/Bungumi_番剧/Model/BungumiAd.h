//
//	BungumiAd.h
//
//	Create by 书敏 吴 on 14/10/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "BungumiHead.h"

@interface BungumiAd : NSObject

@property (nonatomic, strong) NSArray * body;
@property (nonatomic, strong) NSArray * head;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end