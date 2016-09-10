#import <UIKit/UIKit.h>

@interface Right : NSObject

@property (nonatomic, assign) NSInteger bp;
@property (nonatomic, assign) NSInteger download;
@property (nonatomic, assign) NSInteger elec;
@property (nonatomic, assign) NSInteger movie;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end