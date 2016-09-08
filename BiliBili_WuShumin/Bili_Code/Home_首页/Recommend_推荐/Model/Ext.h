#import <UIKit/UIKit.h>

@interface Ext : NSObject

@property (nonatomic, assign) NSInteger liveCount;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end