//
//	OwnerExt.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "OwnerExt.h"

@interface OwnerExt ()
@end
@implementation OwnerExt




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"live"] isKindOfClass:[NSNull class]]){
		self.live = [[Live alloc] initWithDictionary:dictionary[@"live"]];
	}

	if(![dictionary[@"vip"] isKindOfClass:[NSNull class]]){
		self.vip = [[Vip alloc] initWithDictionary:dictionary[@"vip"]];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.live != nil){
		dictionary[@"live"] = [self.live toDictionary];
	}
	if(self.vip != nil){
		dictionary[@"vip"] = [self.vip toDictionary];
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
	if(self.live != nil){
		[aCoder encodeObject:self.live forKey:@"live"];
	}
	if(self.vip != nil){
		[aCoder encodeObject:self.vip forKey:@"vip"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.live = [aDecoder decodeObjectForKey:@"live"];
	self.vip = [aDecoder decodeObjectForKey:@"vip"];
	return self;

}
@end