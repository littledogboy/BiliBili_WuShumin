#import <UIKit/UIKit.h>
#import "Eleclist.h"

@interface Elec : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSArray * eleclist;
@property (nonatomic, assign) BOOL show;
@property (nonatomic, assign) NSInteger total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end