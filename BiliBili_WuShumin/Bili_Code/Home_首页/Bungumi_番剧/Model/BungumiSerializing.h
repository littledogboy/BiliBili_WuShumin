//
//	BungumiSerializing.h
//
//	Create by 书敏 吴 on 14/10/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface BungumiSerializing : NSObject

@property (nonatomic, strong) NSString * cover;
@property (nonatomic, strong) NSString * favourites;
@property (nonatomic, assign) NSInteger isFinish;
@property (nonatomic, assign) NSInteger isStarted;
@property (nonatomic, assign) NSInteger lastTime;
@property (nonatomic, strong) NSString * newestEpIndex;
@property (nonatomic, assign) NSInteger pubTime;
@property (nonatomic, assign) NSInteger seasonId;
@property (nonatomic, assign) NSInteger seasonStatus;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger watchingCount;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end