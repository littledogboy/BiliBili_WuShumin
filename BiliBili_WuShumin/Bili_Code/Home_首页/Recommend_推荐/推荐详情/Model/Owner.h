#import <UIKit/UIKit.h>
#import "Pendant.h"

@interface Owner : NSObject

@property (nonatomic, strong) NSString * face;
@property (nonatomic, assign) NSInteger mid;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) Pendant * pendant;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end