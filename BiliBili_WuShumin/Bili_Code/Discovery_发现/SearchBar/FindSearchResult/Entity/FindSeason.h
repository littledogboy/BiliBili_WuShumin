//
//	FindSeason.h
//
//	Create by 书敏 吴 on 26/12/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "FindOfficialVerify.h"

@interface FindSeason : NSObject

@property (nonatomic, strong) NSString * catDesc;
@property (nonatomic, strong) NSString * cover;
@property (nonatomic, assign) NSInteger finish;
@property (nonatomic, strong) NSString * gotoField;
@property (nonatomic, strong) NSString * index;
@property (nonatomic, strong) NSString * newestCat;
@property (nonatomic, strong) NSString * newestSeason;
@property (nonatomic, strong) FindOfficialVerify * officialVerify;
@property (nonatomic, strong) NSString * param;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger totalCount;
@property (nonatomic, strong) NSString * uri;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end