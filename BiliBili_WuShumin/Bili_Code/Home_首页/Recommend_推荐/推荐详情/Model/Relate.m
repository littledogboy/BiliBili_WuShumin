//
//	Relate.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Relate.h"

@interface Relate ()
@end
@implementation Relate




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"aid"] isKindOfClass:[NSNull class]]){
		self.aid = [dictionary[@"aid"] integerValue];
	}

	if(![dictionary[@"owner"] isKindOfClass:[NSNull class]]){
		self.owner = [[Owner alloc] initWithDictionary:dictionary[@"owner"]];
	}

	if(![dictionary[@"pic"] isKindOfClass:[NSNull class]]){
		self.pic = dictionary[@"pic"];
	}	
	if(![dictionary[@"stat"] isKindOfClass:[NSNull class]]){
		self.stat = [[Stat alloc] initWithDictionary:dictionary[@"stat"]];
	}

	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"aid"] = @(self.aid);
	if(self.owner != nil){
		dictionary[@"owner"] = [self.owner toDictionary];
	}
	if(self.pic != nil){
		dictionary[@"pic"] = self.pic;
	}
	if(self.stat != nil){
		dictionary[@"stat"] = [self.stat toDictionary];
	}
	if(self.title != nil){
		dictionary[@"title"] = self.title;
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
	[aCoder encodeObject:@(self.aid) forKey:@"aid"];	if(self.owner != nil){
		[aCoder encodeObject:self.owner forKey:@"owner"];
	}
	if(self.pic != nil){
		[aCoder encodeObject:self.pic forKey:@"pic"];
	}
	if(self.stat != nil){
		[aCoder encodeObject:self.stat forKey:@"stat"];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.aid = [[aDecoder decodeObjectForKey:@"aid"] integerValue];
	self.owner = [aDecoder decodeObjectForKey:@"owner"];
	self.pic = [aDecoder decodeObjectForKey:@"pic"];
	self.stat = [aDecoder decodeObjectForKey:@"stat"];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	return self;

}
@end