#import <UIKit/UIKit.h>
#import "Owner.h"
#import "Page.h"
#import "Relate.h"
#import "ReqUser.h"
#import "Right.h"
#import "Stat.h"

@interface Movie : NSObject

@property (nonatomic, assign) NSInteger aid;
@property (nonatomic, assign) NSInteger copyright;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) Owner * owner;
@property (nonatomic, strong) NSArray * pages;
@property (nonatomic, strong) NSString * pic;
@property (nonatomic, assign) NSInteger pubdate;
@property (nonatomic, strong) NSArray * relates;
@property (nonatomic, strong) ReqUser * reqUser;
@property (nonatomic, strong) Right * rights;
@property (nonatomic, strong) Stat * stat;
@property (nonatomic, strong) NSArray * tags;
@property (nonatomic, strong) NSString * tid;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * tname;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end