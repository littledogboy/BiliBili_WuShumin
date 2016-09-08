#import <UIKit/UIKit.h>
#import "List.h"

@interface RootClass : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSArray * list;
@property (nonatomic, assign) NSInteger pages;
@property (nonatomic, assign) NSInteger results;

-(NSDictionary *)toDictionary;
@end