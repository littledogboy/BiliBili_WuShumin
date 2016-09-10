//
//	Owner.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Owner.h"

@interface Owner ()
@end
@implementation Owner




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"face"] isKindOfClass:[NSNull class]]){
		self.face = dictionary[@"face"];
	}	
	if(![dictionary[@"mid"] isKindOfClass:[NSNull class]]){
		self.mid = [dictionary[@"mid"] integerValue];
	}

	if(![dictionary[@"name"] isKindOfClass:[NSNull class]]){
		self.name = dictionary[@"name"];
	}	
	if(![dictionary[@"pendant"] isKindOfClass:[NSNull class]]){
		self.pendant = [[Pendant alloc] initWithDictionary:dictionary[@"pendant"]];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.face != nil){
		dictionary[@"face"] = self.face;
	}
	dictionary[@"mid"] = @(self.mid);
	if(self.name != nil){
		dictionary[@"name"] = self.name;
	}
	if(self.pendant != nil){
		dictionary[@"pendant"] = [self.pendant toDictionary];
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
	if(self.face != nil){
		[aCoder encodeObject:self.face forKey:@"face"];
	}
	[aCoder encodeObject:@(self.mid) forKey:@"mid"];	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:@"name"];
	}
	if(self.pendant != nil){
		[aCoder encodeObject:self.pendant forKey:@"pendant"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.face = [aDecoder decodeObjectForKey:@"face"];
	self.mid = [[aDecoder decodeObjectForKey:@"mid"] integerValue];
	self.name = [aDecoder decodeObjectForKey:@"name"];
	self.pendant = [aDecoder decodeObjectForKey:@"pendant"];
	return self;

}
@end