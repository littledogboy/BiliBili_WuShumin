#import <UIKit/UIKit.h>

@interface ReqUser : NSObject

@property (nonatomic, assign) NSInteger attention;
@property (nonatomic, assign) NSInteger favorite;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end