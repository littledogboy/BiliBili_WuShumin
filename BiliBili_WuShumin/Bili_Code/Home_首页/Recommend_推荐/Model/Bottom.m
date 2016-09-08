//
//	Bottom.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Bottom.h"

@interface Bottom ()
@end
@implementation Bottom




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"hash"] isKindOfClass:[NSNull class]]){
		self.hashValue = dictionary[@"hash"];
	}	
	if(![dictionary[@"id"] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[@"id"] integerValue];
	}

	if(![dictionary[@"image"] isKindOfClass:[NSNull class]]){
		self.image = dictionary[@"image"];
	}	
	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	if(![dictionary[@"uri"] isKindOfClass:[NSNull class]]){
		self.uri = dictionary[@"uri"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.hashValue != nil){
		dictionary[@"hash"] = self.hashValue;
	}
	dictionary[@"id"] = @(self.idField);
	if(self.image != nil){
		dictionary[@"image"] = self.image;
	}
	if(self.title != nil){
		dictionary[@"title"] = self.title;
	}
	if(self.uri != nil){
		dictionary[@"uri"] = self.uri;
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
	if(self.hashValue != nil){
		[aCoder encodeObject:self.hashValue forKey:@"hash"];
	}
	[aCoder encodeObject:@(self.idField) forKey:@"id"];	if(self.image != nil){
		[aCoder encodeObject:self.image forKey:@"image"];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}
	if(self.uri != nil){
		[aCoder encodeObject:self.uri forKey:@"uri"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.hashValue = [aDecoder decodeObjectForKey:@"hash"];
	self.idField = [[aDecoder decodeObjectForKey:@"id"] integerValue];
	self.image = [aDecoder decodeObjectForKey:@"image"];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	self.uri = [aDecoder decodeObjectForKey:@"uri"];
	return self;

}
@end