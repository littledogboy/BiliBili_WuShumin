//
//	Page.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Page.h"

@interface Page ()
@end
@implementation Page




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"cid"] isKindOfClass:[NSNull class]]){
		self.cid = [dictionary[@"cid"] integerValue];
	}

	if(![dictionary[@"from"] isKindOfClass:[NSNull class]]){
		self.from = dictionary[@"from"];
	}	
	if(![dictionary[@"has_alias"] isKindOfClass:[NSNull class]]){
		self.hasAlias = [dictionary[@"has_alias"] integerValue];
	}

	if(![dictionary[@"link"] isKindOfClass:[NSNull class]]){
		self.link = dictionary[@"link"];
	}	
	if(![dictionary[@"page"] isKindOfClass:[NSNull class]]){
		self.page = [dictionary[@"page"] integerValue];
	}

	if(![dictionary[@"part"] isKindOfClass:[NSNull class]]){
		self.part = dictionary[@"part"];
	}	
	if(![dictionary[@"rich_vid"] isKindOfClass:[NSNull class]]){
		self.richVid = dictionary[@"rich_vid"];
	}	
	if(![dictionary[@"vid"] isKindOfClass:[NSNull class]]){
		self.vid = dictionary[@"vid"];
	}	
	if(![dictionary[@"weblink"] isKindOfClass:[NSNull class]]){
		self.weblink = dictionary[@"weblink"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"cid"] = @(self.cid);
	if(self.from != nil){
		dictionary[@"from"] = self.from;
	}
	dictionary[@"has_alias"] = @(self.hasAlias);
	if(self.link != nil){
		dictionary[@"link"] = self.link;
	}
	dictionary[@"page"] = @(self.page);
	if(self.part != nil){
		dictionary[@"part"] = self.part;
	}
	if(self.richVid != nil){
		dictionary[@"rich_vid"] = self.richVid;
	}
	if(self.vid != nil){
		dictionary[@"vid"] = self.vid;
	}
	if(self.weblink != nil){
		dictionary[@"weblink"] = self.weblink;
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
	[aCoder encodeObject:@(self.cid) forKey:@"cid"];	if(self.from != nil){
		[aCoder encodeObject:self.from forKey:@"from"];
	}
	[aCoder encodeObject:@(self.hasAlias) forKey:@"has_alias"];	if(self.link != nil){
		[aCoder encodeObject:self.link forKey:@"link"];
	}
	[aCoder encodeObject:@(self.page) forKey:@"page"];	if(self.part != nil){
		[aCoder encodeObject:self.part forKey:@"part"];
	}
	if(self.richVid != nil){
		[aCoder encodeObject:self.richVid forKey:@"rich_vid"];
	}
	if(self.vid != nil){
		[aCoder encodeObject:self.vid forKey:@"vid"];
	}
	if(self.weblink != nil){
		[aCoder encodeObject:self.weblink forKey:@"weblink"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.cid = [[aDecoder decodeObjectForKey:@"cid"] integerValue];
	self.from = [aDecoder decodeObjectForKey:@"from"];
	self.hasAlias = [[aDecoder decodeObjectForKey:@"has_alias"] integerValue];
	self.link = [aDecoder decodeObjectForKey:@"link"];
	self.page = [[aDecoder decodeObjectForKey:@"page"] integerValue];
	self.part = [aDecoder decodeObjectForKey:@"part"];
	self.richVid = [aDecoder decodeObjectForKey:@"rich_vid"];
	self.vid = [aDecoder decodeObjectForKey:@"vid"];
	self.weblink = [aDecoder decodeObjectForKey:@"weblink"];
	return self;

}
@end