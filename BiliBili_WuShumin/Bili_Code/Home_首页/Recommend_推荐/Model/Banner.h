#import <UIKit/UIKit.h>
#import "Bottom.h"

@interface Banner : NSObject

@property (nonatomic, strong) NSArray<Bottom *> *bottom;

@property (nonatomic, strong) NSArray<Bottom *> *top;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end