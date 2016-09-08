#import <UIKit/UIKit.h>

@interface List : NSObject

@property (nonatomic, assign) NSInteger aid;
@property (nonatomic, strong) NSString * author;
@property (nonatomic, assign) NSInteger coins;
@property (nonatomic, strong) NSString * create;
@property (nonatomic, assign) NSInteger credit;
@property (nonatomic, strong) NSString * descriptionField;
@property (nonatomic, strong) NSString * duration;
@property (nonatomic, assign) NSInteger favorites;
@property (nonatomic, assign) NSInteger mid;
@property (nonatomic, strong) NSString * pic;
@property (nonatomic, assign) NSInteger play;
@property (nonatomic, strong) NSString * pubdate;
@property (nonatomic, assign) NSInteger review;
@property (nonatomic, strong) NSString * subtitle;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger typeid;
@property (nonatomic, assign) NSInteger videoReview;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end