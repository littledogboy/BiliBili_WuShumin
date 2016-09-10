//
//	Movie.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Movie.h"

@interface Movie ()
@end
@implementation Movie




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"aid"] isKindOfClass:[NSNull class]]){
		self.aid = [dictionary[@"aid"] integerValue];
	}

	if(![dictionary[@"copyright"] isKindOfClass:[NSNull class]]){
		self.copyright = [dictionary[@"copyright"] integerValue];
	}

	if(![dictionary[@"desc"] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[@"desc"];
	}	
	if(![dictionary[@"owner"] isKindOfClass:[NSNull class]]){
		self.owner = [[Owner alloc] initWithDictionary:dictionary[@"owner"]];
	}

	if(dictionary[@"pages"] != nil && [dictionary[@"pages"] isKindOfClass:[NSArray class]]){
		NSArray * pagesDictionaries = dictionary[@"pages"];
		NSMutableArray * pagesItems = [NSMutableArray array];
		for(NSDictionary * pagesDictionary in pagesDictionaries){
			Page * pagesItem = [[Page alloc] initWithDictionary:pagesDictionary];
			[pagesItems addObject:pagesItem];
		}
		self.pages = pagesItems;
	}
	if(![dictionary[@"pic"] isKindOfClass:[NSNull class]]){
		self.pic = dictionary[@"pic"];
	}	
	if(![dictionary[@"pubdate"] isKindOfClass:[NSNull class]]){
		self.pubdate = [dictionary[@"pubdate"] integerValue];
	}

	if(dictionary[@"relates"] != nil && [dictionary[@"relates"] isKindOfClass:[NSArray class]]){
		NSArray * relatesDictionaries = dictionary[@"relates"];
		NSMutableArray * relatesItems = [NSMutableArray array];
		for(NSDictionary * relatesDictionary in relatesDictionaries){
			Relate * relatesItem = [[Relate alloc] initWithDictionary:relatesDictionary];
			[relatesItems addObject:relatesItem];
		}
		self.relates = relatesItems;
	}
	if(![dictionary[@"req_user"] isKindOfClass:[NSNull class]]){
		self.reqUser = [[ReqUser alloc] initWithDictionary:dictionary[@"req_user"]];
	}

	if(![dictionary[@"rights"] isKindOfClass:[NSNull class]]){
		self.rights = [[Right alloc] initWithDictionary:dictionary[@"rights"]];
	}

	if(![dictionary[@"stat"] isKindOfClass:[NSNull class]]){
		self.stat = [[Stat alloc] initWithDictionary:dictionary[@"stat"]];
	}

	if(![dictionary[@"tags"] isKindOfClass:[NSNull class]]){
		self.tags = dictionary[@"tags"];
	}	
	if(![dictionary[@"tid"] isKindOfClass:[NSNull class]]){
		self.tid = dictionary[@"tid"];
	}	
	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	if(![dictionary[@"tname"] isKindOfClass:[NSNull class]]){
		self.tname = dictionary[@"tname"];
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
	dictionary[@"copyright"] = @(self.copyright);
	if(self.desc != nil){
		dictionary[@"desc"] = self.desc;
	}
	if(self.owner != nil){
		dictionary[@"owner"] = [self.owner toDictionary];
	}
	if(self.pages != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Page * pagesElement in self.pages){
			[dictionaryElements addObject:[pagesElement toDictionary]];
		}
		dictionary[@"pages"] = dictionaryElements;
	}
	if(self.pic != nil){
		dictionary[@"pic"] = self.pic;
	}
	dictionary[@"pubdate"] = @(self.pubdate);
	if(self.relates != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Relate * relatesElement in self.relates){
			[dictionaryElements addObject:[relatesElement toDictionary]];
		}
		dictionary[@"relates"] = dictionaryElements;
	}
	if(self.reqUser != nil){
		dictionary[@"req_user"] = [self.reqUser toDictionary];
	}
	if(self.rights != nil){
		dictionary[@"rights"] = [self.rights toDictionary];
	}
	if(self.stat != nil){
		dictionary[@"stat"] = [self.stat toDictionary];
	}
	if(self.tags != nil){
		dictionary[@"tags"] = self.tags;
	}
	if(self.tid != nil){
		dictionary[@"tid"] = self.tid;
	}
	if(self.title != nil){
		dictionary[@"title"] = self.title;
	}
	if(self.tname != nil){
		dictionary[@"tname"] = self.tname;
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
	[aCoder encodeObject:@(self.aid) forKey:@"aid"];	[aCoder encodeObject:@(self.copyright) forKey:@"copyright"];	if(self.desc != nil){
		[aCoder encodeObject:self.desc forKey:@"desc"];
	}
	if(self.owner != nil){
		[aCoder encodeObject:self.owner forKey:@"owner"];
	}
	if(self.pages != nil){
		[aCoder encodeObject:self.pages forKey:@"pages"];
	}
	if(self.pic != nil){
		[aCoder encodeObject:self.pic forKey:@"pic"];
	}
	[aCoder encodeObject:@(self.pubdate) forKey:@"pubdate"];	if(self.relates != nil){
		[aCoder encodeObject:self.relates forKey:@"relates"];
	}
	if(self.reqUser != nil){
		[aCoder encodeObject:self.reqUser forKey:@"req_user"];
	}
	if(self.rights != nil){
		[aCoder encodeObject:self.rights forKey:@"rights"];
	}
	if(self.stat != nil){
		[aCoder encodeObject:self.stat forKey:@"stat"];
	}
	if(self.tags != nil){
		[aCoder encodeObject:self.tags forKey:@"tags"];
	}
	if(self.tid != nil){
		[aCoder encodeObject:self.tid forKey:@"tid"];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}
	if(self.tname != nil){
		[aCoder encodeObject:self.tname forKey:@"tname"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.aid = [[aDecoder decodeObjectForKey:@"aid"] integerValue];
	self.copyright = [[aDecoder decodeObjectForKey:@"copyright"] integerValue];
	self.desc = [aDecoder decodeObjectForKey:@"desc"];
	self.owner = [aDecoder decodeObjectForKey:@"owner"];
	self.pages = [aDecoder decodeObjectForKey:@"pages"];
	self.pic = [aDecoder decodeObjectForKey:@"pic"];
	self.pubdate = [[aDecoder decodeObjectForKey:@"pubdate"] integerValue];
	self.relates = [aDecoder decodeObjectForKey:@"relates"];
	self.reqUser = [aDecoder decodeObjectForKey:@"req_user"];
	self.rights = [aDecoder decodeObjectForKey:@"rights"];
	self.stat = [aDecoder decodeObjectForKey:@"stat"];
	self.tags = [aDecoder decodeObjectForKey:@"tags"];
	self.tid = [aDecoder decodeObjectForKey:@"tid"];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	self.tname = [aDecoder decodeObjectForKey:@"tname"];
	return self;

}
@end