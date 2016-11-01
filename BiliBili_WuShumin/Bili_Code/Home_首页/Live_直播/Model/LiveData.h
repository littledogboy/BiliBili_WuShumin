//
//	LiveData.h
//
//	Create by 书敏 吴 on 27/10/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "LiveBanner.h"
#import "LiveEntranceIcon.h"
#import "LivePartition.h"

@interface LiveData : NSObject

@property (nonatomic, strong) NSArray * banner;
@property (nonatomic, strong) NSArray * entranceIcons;
@property (nonatomic, strong) NSArray * partitions;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end