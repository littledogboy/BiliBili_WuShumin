//
//	LiveBanner.h
//
//	Create by 书敏 吴 on 27/10/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface LiveBanner : NSObject

@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * link;
@property (nonatomic, strong) NSString * remark;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end