#import <UIKit/UIKit.h>
#import "Live.h"
#import "Vip.h"

@interface OwnerExt : NSObject

@property (nonatomic, strong) Live * live;
@property (nonatomic, strong) Vip * vip;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end