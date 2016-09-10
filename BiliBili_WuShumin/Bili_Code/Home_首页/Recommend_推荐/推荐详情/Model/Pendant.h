#import <UIKit/UIKit.h>

@interface Pendant : NSObject

@property (nonatomic, assign) NSInteger expire;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, strong) NSString * name;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end