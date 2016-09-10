//
//	Pendant.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Pendant.h"

@interface Pendant ()
@end
@implementation Pendant




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"expire"] isKindOfClass:[NSNull class]]){
		self.expire = [dictionary[@"expire"] integerValue];
	}

	if(![dictionary[@"image"] isKindOfClass:[NSNull class]]){
		self.image = dictionary[@"image"];
	}	
	if(![dictionary[@"name"] isKindOfClass:[NSNull class]]){
		self.name = dictionary[@"name"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"expire"] = @(self.expire);
	if(self.image != nil){
		dictionary[@"image"] = self.image;
	}
	if(self.name != nil){
		dictionary[@"name"] = self.name;
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
	[aCoder encodeObject:@(self.expire) forKey:@"expire"];	if(self.image != nil){
		[aCoder encodeObject:self.image forKey:@"image"];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:@"name"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.expire = [[aDecoder decodeObjectForKey:@"expire"] integerValue];
	self.image = [aDecoder decodeObjectForKey:@"image"];
	self.name = [aDecoder decodeObjectForKey:@"name"];
	return self;

}
@end