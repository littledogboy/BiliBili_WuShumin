#import <UIKit/UIKit.h>

@interface Page : NSObject

@property (nonatomic, assign) NSInteger cid;
@property (nonatomic, strong) NSString * from;
@property (nonatomic, assign) NSInteger hasAlias;
@property (nonatomic, strong) NSString * link;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSString * part;
@property (nonatomic, strong) NSString * richVid;
@property (nonatomic, strong) NSString * vid;
@property (nonatomic, strong) NSString * weblink;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end