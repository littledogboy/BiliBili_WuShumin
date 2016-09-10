//
//	Stat.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Stat.h"

@interface Stat ()
@end
@implementation Stat




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"coin"] isKindOfClass:[NSNull class]]){
		self.coin = [dictionary[@"coin"] integerValue];
	}

	if(![dictionary[@"danmaku"] isKindOfClass:[NSNull class]]){
		self.danmaku = [dictionary[@"danmaku"] integerValue];
	}

	if(![dictionary[@"favorite"] isKindOfClass:[NSNull class]]){
		self.favorite = [dictionary[@"favorite"] integerValue];
	}

	if(![dictionary[@"reply"] isKindOfClass:[NSNull class]]){
		self.reply = [dictionary[@"reply"] integerValue];
	}

	if(![dictionary[@"share"] isKindOfClass:[NSNull class]]){
		self.share = [dictionary[@"share"] integerValue];
	}

	if(![dictionary[@"view"] isKindOfClass:[NSNull class]]){
		self.view = [dictionary[@"view"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"coin"] = @(self.coin);
	dictionary[@"danmaku"] = @(self.danmaku);
	dictionary[@"favorite"] = @(self.favorite);
	dictionary[@"reply"] = @(self.reply);
	dictionary[@"share"] = @(self.share);
	dictionary[@"view"] = @(self.view);
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
	[aCoder encodeObject:@(self.coin) forKey:@"coin"];	[aCoder encodeObject:@(self.danmaku) forKey:@"danmaku"];	[aCoder encodeObject:@(self.favorite) forKey:@"favorite"];	[aCoder encodeObject:@(self.reply) forKey:@"reply"];	[aCoder encodeObject:@(self.share) forKey:@"share"];	[aCoder encodeObject:@(self.view) forKey:@"view"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.coin = [[aDecoder decodeObjectForKey:@"coin"] integerValue];
	self.danmaku = [[aDecoder decodeObjectForKey:@"danmaku"] integerValue];
	self.favorite = [[aDecoder decodeObjectForKey:@"favorite"] integerValue];
	self.reply = [[aDecoder decodeObjectForKey:@"reply"] integerValue];
	self.share = [[aDecoder decodeObjectForKey:@"share"] integerValue];
	self.view = [[aDecoder decodeObjectForKey:@"view"] integerValue];
	return self;

}
@end