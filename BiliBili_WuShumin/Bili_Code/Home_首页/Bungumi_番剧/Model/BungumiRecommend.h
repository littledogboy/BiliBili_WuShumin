//
//	BungumiRecommend.h
//
//	Create by 书敏 吴 on 17/10/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface BungumiRecommend : NSObject

@property (nonatomic, strong) NSString * cover;
@property (nonatomic, assign) CGFloat cursor;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger isNew;
@property (nonatomic, strong) NSString * link;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end