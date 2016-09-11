#import <UIKit/UIKit.h>

@interface VipInfo : NSObject

@property (nonatomic, assign) NSInteger vipStatus;
@property (nonatomic, assign) NSInteger vipType;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end