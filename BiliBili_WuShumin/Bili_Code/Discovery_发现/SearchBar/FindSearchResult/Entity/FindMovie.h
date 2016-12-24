//
//	FindMovie.h
//
//	Create by 书敏 吴 on 24/12/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "FindOfficialVerify.h"

@interface FindMovie : NSObject

@property (nonatomic, strong) NSString * actors;
@property (nonatomic, strong) NSString * area;
@property (nonatomic, strong) NSString * cover;
@property (nonatomic, strong) NSString * coverMark;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSString * gotoField;
@property (nonatomic, assign) NSInteger length;
@property (nonatomic, strong) FindOfficialVerify * officialVerify;
@property (nonatomic, strong) NSString * param;
@property (nonatomic, strong) NSString * screenDate;
@property (nonatomic, strong) NSString * staff;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger totalCount;
@property (nonatomic, strong) NSString * uri;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end