//
//	Elec.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Elec.h"

@interface Elec ()
@end
@implementation Elec




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"count"] isKindOfClass:[NSNull class]]){
		self.count = [dictionary[@"count"] integerValue];
	}

	if(dictionary[@"eleclist"] != nil && [dictionary[@"list"] isKindOfClass:[NSArray class]]){
		NSArray * eleclistDictionaries = dictionary[@"list"];
		NSMutableArray * eleclistItems = [NSMutableArray array];
		for(NSDictionary * eleclistDictionary in eleclistDictionaries){
			Eleclist * eleclistItem = [[Eleclist alloc] initWithDictionary:eleclistDictionary];
			[eleclistItems addObject:eleclistItem];
		}
		self.eleclist = eleclistItems;
	}
	if(![dictionary[@"show"] isKindOfClass:[NSNull class]]){
		self.show = [dictionary[@"show"] boolValue];
	}

	if(![dictionary[@"total"] isKindOfClass:[NSNull class]]){
		self.total = [dictionary[@"total"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"count"] = @(self.count);
	if(self.eleclist != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Eleclist * eleclistElement in self.eleclist){
			[dictionaryElements addObject:[eleclistElement toDictionary]];
		}
		dictionary[@"list"] = dictionaryElements;
	}
	dictionary[@"show"] = @(self.show);
	dictionary[@"total"] = @(self.total);
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
	[aCoder encodeObject:@(self.count) forKey:@"count"];	if(self.eleclist != nil){
		[aCoder encodeObject:self.eleclist forKey:@"list"];
	}
	[aCoder encodeObject:@(self.show) forKey:@"show"];	[aCoder encodeObject:@(self.total) forKey:@"total"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.count = [[aDecoder decodeObjectForKey:@"count"] integerValue];
	self.eleclist = [aDecoder decodeObjectForKey:@"list"];
	self.show = [[aDecoder decodeObjectForKey:@"show"] boolValue];
	self.total = [[aDecoder decodeObjectForKey:@"total"] integerValue];
	return self;

}
@end