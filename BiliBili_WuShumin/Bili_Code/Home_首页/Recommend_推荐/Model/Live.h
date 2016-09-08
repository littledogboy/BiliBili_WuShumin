#import <UIKit/UIKit.h>

@interface Live : NSObject

@property (nonatomic, strong) NSString * area;
@property (nonatomic, assign) NSInteger areaId;
@property (nonatomic, strong) NSString * cover;
@property (nonatomic, strong) NSString * face;
@property (nonatomic, assign) NSInteger finish;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger online;
@property (nonatomic, strong) NSString * param;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end