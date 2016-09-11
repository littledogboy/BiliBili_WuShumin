//
//	VipInfo.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "VipInfo.h"

@interface VipInfo ()
@end
@implementation VipInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"vipStatus"] isKindOfClass:[NSNull class]]){
		self.vipStatus = [dictionary[@"vipStatus"] integerValue];
	}

	if(![dictionary[@"vipType"] isKindOfClass:[NSNull class]]){
		self.vipType = [dictionary[@"vipType"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"vipStatus"] = @(self.vipStatus);
	dictionary[@"vipType"] = @(self.vipType);
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
	[aCoder encodeObject:@(self.vipStatus) forKey:@"vipStatus"];	[aCoder encodeObject:@(self.vipType) forKey:@"vipType"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.vipStatus = [[aDecoder decodeObjectForKey:@"vipStatus"] integerValue];
	self.vipType = [[aDecoder decodeObjectForKey:@"vipType"] integerValue];
	return self;

}
@end