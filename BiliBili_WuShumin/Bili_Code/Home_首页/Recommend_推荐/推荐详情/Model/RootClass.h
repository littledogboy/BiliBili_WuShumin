#import <UIKit/UIKit.h>
#import "Data.h"

@interface RootClass : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) Data * data;
@property (nonatomic, strong) NSString * message;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end