#import <UIKit/UIKit.h>

@interface Owner : NSObject

@property (nonatomic, strong) NSString * face;
@property (nonatomic, assign) NSInteger mid;
@property (nonatomic, strong) NSString * name;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end