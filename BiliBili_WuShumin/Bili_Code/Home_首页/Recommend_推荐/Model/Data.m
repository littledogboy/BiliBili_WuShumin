//
//	Data.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Data.h"

@interface Data ()
@end
@implementation Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"banner"] isKindOfClass:[NSNull class]]){
		self.banner = [[Banner alloc] initWithDictionary:dictionary[@"banner"]];
	}

	if(dictionary[@"body"] != nil && [dictionary[@"body"] isKindOfClass:[NSArray class]]){
		NSArray * bodyDictionaries = dictionary[@"body"];
		NSMutableArray * bodyItems = [NSMutableArray array];
		for(NSDictionary * bodyDictionary in bodyDictionaries){
			Body * bodyItem = [[Body alloc] initWithDictionary:bodyDictionary];
			[bodyItems addObject:bodyItem];
		}
		self.body = bodyItems;
	}
	if(![dictionary[@"ext"] isKindOfClass:[NSNull class]]){
		self.ext = [[Ext alloc] initWithDictionary:dictionary[@"ext"]];
	}

	if(![dictionary[@"param"] isKindOfClass:[NSNull class]]){
		self.param = dictionary[@"param"];
	}	
	if(![dictionary[@"style"] isKindOfClass:[NSNull class]]){
		self.style = dictionary[@"style"];
	}	
	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	if(![dictionary[@"type"] isKindOfClass:[NSNull class]]){
		self.type = dictionary[@"type"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.banner != nil){
		dictionary[@"banner"] = [self.banner toDictionary];
	}
	if(self.body != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Body * bodyElement in self.body){
			[dictionaryElements addObject:[bodyElement toDictionary]];
		}
		dictionary[@"body"] = dictionaryElements;
	}
	if(self.ext != nil){
		dictionary[@"ext"] = [self.ext toDictionary];
	}
	if(self.param != nil){
		dictionary[@"param"] = self.param;
	}
	if(self.style != nil){
		dictionary[@"style"] = self.style;
	}
	if(self.title != nil){
		dictionary[@"title"] = self.title;
	}
	if(self.type != nil){
		dictionary[@"type"] = self.type;
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
	if(self.banner != nil){
		[aCoder encodeObject:self.banner forKey:@"banner"];
	}
	if(self.body != nil){
		[aCoder encodeObject:self.body forKey:@"body"];
	}
	if(self.ext != nil){
		[aCoder encodeObject:self.ext forKey:@"ext"];
	}
	if(self.param != nil){
		[aCoder encodeObject:self.param forKey:@"param"];
	}
	if(self.style != nil){
		[aCoder encodeObject:self.style forKey:@"style"];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}
	if(self.type != nil){
		[aCoder encodeObject:self.type forKey:@"type"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.banner = [aDecoder decodeObjectForKey:@"banner"];
	self.body = [aDecoder decodeObjectForKey:@"body"];
	self.ext = [aDecoder decodeObjectForKey:@"ext"];
	self.param = [aDecoder decodeObjectForKey:@"param"];
	self.style = [aDecoder decodeObjectForKey:@"style"];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	self.type = [aDecoder decodeObjectForKey:@"type"];
	return self;

}
@end