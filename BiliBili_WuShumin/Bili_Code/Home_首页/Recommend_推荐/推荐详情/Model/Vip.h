#import <UIKit/UIKit.h>

@interface Vip : NSObject

@property (nonatomic, assign) NSInteger accessStatus;
@property (nonatomic, strong) NSString * dueRemark;
@property (nonatomic, assign) NSInteger vipDueDate;
@property (nonatomic, assign) NSInteger vipStatus;
@property (nonatomic, strong) NSString * vipStatusWarn;
@property (nonatomic, assign) NSInteger vipType;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end