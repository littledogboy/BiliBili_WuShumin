#import <UIKit/UIKit.h>

@interface Bottom : NSObject

@property (nonatomic, strong) NSString * hashValue;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * uri;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end