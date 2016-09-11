#import <UIKit/UIKit.h>

@interface Live : NSObject

@property (nonatomic, assign) NSInteger mid;
@property (nonatomic, assign) NSInteger roomid;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end