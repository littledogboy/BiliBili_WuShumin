//
//	Live.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Live.h"

@interface Live ()
@end
@implementation Live




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"area"] isKindOfClass:[NSNull class]]){
		self.area = dictionary[@"area"];
	}	
	if(![dictionary[@"area_id"] isKindOfClass:[NSNull class]]){
		self.areaId = [dictionary[@"area_id"] integerValue];
	}

	if(![dictionary[@"cover"] isKindOfClass:[NSNull class]]){
		self.cover = dictionary[@"cover"];
	}	
	if(![dictionary[@"face"] isKindOfClass:[NSNull class]]){
		self.face = dictionary[@"face"];
	}	
	if(![dictionary[@"finish"] isKindOfClass:[NSNull class]]){
		self.finish = [dictionary[@"finish"] integerValue];
	}

	if(![dictionary[@"name"] isKindOfClass:[NSNull class]]){
		self.name = dictionary[@"name"];
	}	
	if(![dictionary[@"online"] isKindOfClass:[NSNull class]]){
		self.online = [dictionary[@"online"] integerValue];
	}

	if(![dictionary[@"param"] isKindOfClass:[NSNull class]]){
		self.param = dictionary[@"param"];
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
	if(self.area != nil){
		dictionary[@"area"] = self.area;
	}
	dictionary[@"area_id"] = @(self.areaId);
	if(self.cover != nil){
		dictionary[@"cover"] = self.cover;
	}
	if(self.face != nil){
		dictionary[@"face"] = self.face;
	}
	dictionary[@"finish"] = @(self.finish);
	if(self.name != nil){
		dictionary[@"name"] = self.name;
	}
	dictionary[@"online"] = @(self.online);
	if(self.param != nil){
		dictionary[@"param"] = self.param;
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
	if(self.area != nil){
		[aCoder encodeObject:self.area forKey:@"area"];
	}
	[aCoder encodeObject:@(self.areaId) forKey:@"area_id"];	if(self.cover != nil){
		[aCoder encodeObject:self.cover forKey:@"cover"];
	}
	if(self.face != nil){
		[aCoder encodeObject:self.face forKey:@"face"];
	}
	[aCoder encodeObject:@(self.finish) forKey:@"finish"];	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:@"name"];
	}
	[aCoder encodeObject:@(self.online) forKey:@"online"];	if(self.param != nil){
		[aCoder encodeObject:self.param forKey:@"param"];
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
	self.area = [aDecoder decodeObjectForKey:@"area"];
	self.areaId = [[aDecoder decodeObjectForKey:@"area_id"] integerValue];
	self.cover = [aDecoder decodeObjectForKey:@"cover"];
	self.face = [aDecoder decodeObjectForKey:@"face"];
	self.finish = [[aDecoder decodeObjectForKey:@"finish"] integerValue];
	self.name = [aDecoder decodeObjectForKey:@"name"];
	self.online = [[aDecoder decodeObjectForKey:@"online"] integerValue];
	self.param = [aDecoder decodeObjectForKey:@"param"];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	return self;

}
@end