#import <UIKit/UIKit.h>

@interface Right : NSObject

@property (nonatomic, assign) NSInteger bp;
@property (nonatomic, assign) NSInteger download;
@property (nonatomic, assign) NSInteger elec;
@property (nonatomic, assign) NSInteger hd5;
@property (nonatomic, assign) NSInteger movie;
@property (nonatomic, assign) NSInteger pay;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end