//
//	LiveRootClass.h
//
//	Create by 书敏 吴 on 28/10/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "Live.h"
#import "LivePartition_Partition.h"

@interface LivePartition : NSObject

@property (nonatomic, strong) NSArray * lives;
@property (nonatomic, strong) LivePartition_Partition * partition;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end