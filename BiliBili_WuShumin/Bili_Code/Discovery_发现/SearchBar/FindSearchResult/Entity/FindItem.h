//
//	FindItem.h
//
//	Create by 书敏 吴 on 24/12/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "FindArchive.h"
#import "FindMovie.h"
#import "FindSeason.h"
#import "FindSP.h"
#import "FindUP.h"

@interface FindItem : NSObject

@property (nonatomic, strong) NSArray<FindArchive *> * archive;
@property (nonatomic, strong) NSArray<FindMovie *> * movie;
@property (nonatomic, strong) NSArray<FindSeason *> * season;
@property (nonatomic, strong) NSArray<FindSP *> * sp;
@property (nonatomic, strong) NSArray<FindUP *> * upper;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end