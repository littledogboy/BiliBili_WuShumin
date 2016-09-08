//
//	Banner.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Banner.h"

@interface Banner ()
@end
@implementation Banner

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[@"bottom"] != nil && [dictionary[@"bottom"] isKindOfClass:[NSArray class]]){
		NSArray * bottomDictionaries = dictionary[@"bottom"];
		NSMutableArray * bottomItems = [NSMutableArray array];
		for(NSDictionary * bottomDictionary in bottomDictionaries){
			Bottom * bottomItem = [[Bottom alloc] initWithDictionary:bottomDictionary];
			[bottomItems addObject:bottomItem];
		}
		self.bottom = bottomItems;
	}
    if(dictionary[@"top"] != nil && [dictionary[@"top"] isKindOfClass:[NSArray class]]){
        NSArray * topDictionaries = dictionary[@"top"];
        NSMutableArray * topItems = [NSMutableArray array];
        for(NSDictionary * topDictionary in topDictionaries){
            Bottom * topItem = [[Bottom alloc] initWithDictionary:topDictionary];
            [topItems addObject:topItem];
        }
        self.top = topItems;
    }
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.bottom != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Bottom * bottomElement in self.bottom){
			[dictionaryElements addObject:[bottomElement toDictionary]];
		}
		dictionary[@"bottom"] = dictionaryElements;
	}
    if(self.top != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(Bottom * topElement in self.top){
            [dictionaryElements addObject:[topElement toDictionary]];
        }
        dictionary[@"top"] = dictionaryElements;
    }
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.bottom != nil){
		[aCoder encodeObject:self.bottom forKey:@"bottom"];
	}
    if(self.top != nil){
        [aCoder encodeObject:self.top forKey:@"top"];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.bottom = [aDecoder decodeObjectForKey:@"bottom"];
    self.top = [aDecoder decodeObjectForKey:@"top"];

	return self;

}
@end