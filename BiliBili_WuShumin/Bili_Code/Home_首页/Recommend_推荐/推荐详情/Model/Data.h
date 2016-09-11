#import <UIKit/UIKit.h>
#import "Elec.h"
#import "Owner.h"
#import "OwnerExt.h"
#import "Page.h"
#import "Relate.h"
#import "ReqUser.h"
#import "Right.h"
#import "Stat.h"

@interface Data : NSObject

@property (nonatomic, assign) NSInteger aid;
@property (nonatomic, assign) NSInteger attribute;
@property (nonatomic, assign) NSInteger copyright;
@property (nonatomic, assign) NSInteger ctime;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, assign) NSInteger duration;
@property (nonatomic, strong) Elec * elec;
@property (nonatomic, strong) Owner * owner;
@property (nonatomic, strong) OwnerExt * ownerExt;
@property (nonatomic, strong) NSArray * pages;
@property (nonatomic, strong) NSString * pic;
@property (nonatomic, assign) NSInteger pubdate;
@property (nonatomic, strong) NSArray * relates;
@property (nonatomic, strong) ReqUser * reqUser;
@property (nonatomic, strong) Right * rights;
@property (nonatomic, strong) Stat * stat;
@property (nonatomic, assign) NSInteger state;
@property (nonatomic, strong) NSArray * tags;
@property (nonatomic, assign) NSInteger tid;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * tname;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end