//
//	FindUP.h
//
//	Create by 书敏 吴 on 26/12/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "FindOfficialVerify.h"

@interface FindUP : NSObject

@property (nonatomic, assign) NSInteger archives;
@property (nonatomic, strong) NSString * cover;
@property (nonatomic, assign) NSInteger fans;
@property (nonatomic, strong) NSString * gotoField;
@property (nonatomic, strong) FindOfficialVerify * officialVerify;
@property (nonatomic, strong) NSString * param;
@property (nonatomic, strong) NSString * sign;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger totalCount;
@property (nonatomic, strong) NSString * uri;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end