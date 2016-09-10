#import <UIKit/UIKit.h>
#import "Owner.h"
#import "Stat.h"

@interface Relate : NSObject

@property (nonatomic, assign) NSInteger aid;
@property (nonatomic, strong) Owner * owner;
@property (nonatomic, strong) NSString * pic;
@property (nonatomic, strong) Stat * stat;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end