#import <UIKit/UIKit.h>
#import "Banner.h"
#import "Body.h"
#import "Ext.h"

@interface Data : NSObject

@property (nonatomic, strong) Banner * banner;
@property (nonatomic, strong) NSArray<Body *> * body;
@property (nonatomic, strong) Ext * ext;
@property (nonatomic, strong) NSString * param;
@property (nonatomic, strong) NSString * style;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end