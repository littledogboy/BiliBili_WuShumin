//
//	Ext.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Ext.h"

@interface Ext ()
@end
@implementation Ext




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"live_count"] isKindOfClass:[NSNull class]]){
		self.liveCount = [dictionary[@"live_count"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"live_count"] = @(self.liveCount);
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
	[aCoder encodeObject:@(self.liveCount) forKey:@"live_count"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.liveCount = [[aDecoder decodeObjectForKey:@"live_count"] integerValue];
	return self;

}
@end