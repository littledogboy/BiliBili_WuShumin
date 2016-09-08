#import <UIKit/UIKit.h>
#import "Live.h"
#import "List.h"

@interface Body : NSObject

@property (nonatomic, strong) NSString * cover;
@property (nonatomic, assign) NSInteger danmaku;
@property (nonatomic, strong) NSString * gotoField;
@property (nonatomic, strong) NSString * param;
@property (nonatomic, assign) NSInteger play;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * uri;

// live
@property (nonatomic, strong) NSString *area;
@property (nonatomic, assign) NSInteger areaId;
@property (nonatomic, assign) NSString *face;
@property (nonatomic, assign) NSString *name;
@property (nonatomic, assign) NSInteger online;
@property (nonatomic, strong) Live *liveModel;

// bangumi
@property (nonatomic, strong) NSString *mtime;

// region
@property (nonatomic, strong) List *listModel;


-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end