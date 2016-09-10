#import <UIKit/UIKit.h>

@interface Stat : NSObject

@property (nonatomic, assign) NSInteger coin;
@property (nonatomic, assign) NSInteger danmaku;
@property (nonatomic, assign) NSInteger favorite;
@property (nonatomic, assign) NSInteger reply;
@property (nonatomic, assign) NSInteger share;
@property (nonatomic, assign) NSInteger view;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end