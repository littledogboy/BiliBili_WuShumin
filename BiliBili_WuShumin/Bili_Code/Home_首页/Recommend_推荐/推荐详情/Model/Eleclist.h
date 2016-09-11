#import <UIKit/UIKit.h>
#import "VipInfo.h"

@interface Eleclist : NSObject

@property (nonatomic, strong) NSString * avatar;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, assign) NSInteger mid;
@property (nonatomic, assign) NSInteger msgDeleted;
@property (nonatomic, assign) NSInteger payMid;
@property (nonatomic, assign) NSInteger rank;
@property (nonatomic, strong) NSString * uname;
@property (nonatomic, strong) VipInfo * vipInfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end