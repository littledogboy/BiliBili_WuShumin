#import <UIKit/UIKit.h>
#import "Data.h"

@interface Recommend : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSArray<Data *> * data;
@property (nonatomic, strong) NSString * message;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end