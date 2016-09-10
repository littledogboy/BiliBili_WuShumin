//
//	ReqUser.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ReqUser.h"

@interface ReqUser ()
@end
@implementation ReqUser




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"attention"] isKindOfClass:[NSNull class]]){
		self.attention = [dictionary[@"attention"] integerValue];
	}

	if(![dictionary[@"favorite"] isKindOfClass:[NSNull class]]){
		self.favorite = [dictionary[@"favorite"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"attention"] = @(self.attention);
	dictionary[@"favorite"] = @(self.favorite);
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
	[aCoder encodeObject:@(self.attention) forKey:@"attention"];	[aCoder encodeObject:@(self.favorite) forKey:@"favorite"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.attention = [[aDecoder decodeObjectForKey:@"attention"] integerValue];
	self.favorite = [[aDecoder decodeObjectForKey:@"favorite"] integerValue];
	return self;

}
@end