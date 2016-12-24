//
//	FindData.h
//
//	Create by 书敏 吴 on 24/12/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "FindItem.h"
#import "FindNav.h"

@interface FindData : NSObject

@property (nonatomic, strong) FindItem * items;
@property (nonatomic, strong) NSArray * nav;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSString * trackid;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end