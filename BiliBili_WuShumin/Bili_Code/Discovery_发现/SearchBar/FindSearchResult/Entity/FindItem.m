//
//	FindItem.m
//
//	Create by 书敏 吴 on 24/12/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "FindItem.h"

@interface FindItem ()
@end
@implementation FindItem




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[@"archive"] != nil && [dictionary[@"archive"] isKindOfClass:[NSArray class]]){
		NSArray * archiveDictionaries = dictionary[@"archive"];
		NSMutableArray * archiveItems = [NSMutableArray array];
		for(NSDictionary * archiveDictionary in archiveDictionaries){
			FindArchive * archiveItem = [[FindArchive alloc] initWithDictionary:archiveDictionary];
			[archiveItems addObject:archiveItem];
		}
		self.archive = archiveItems;
	}
	if(![dictionary[@"movie"] isKindOfClass:[NSNull class]]){
		self.movie = dictionary[@"movie"];
	}	
	if(![dictionary[@"season"] isKindOfClass:[NSNull class]]){
		self.season = dictionary[@"season"];
	}	
	if(![dictionary[@"sp"] isKindOfClass:[NSNull class]]){
		self.sp = dictionary[@"sp"];
	}	
	if(![dictionary[@"upper"] isKindOfClass:[NSNull class]]){
		self.upper = dictionary[@"upper"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.archive != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(FindArchive * archiveElement in self.archive){
			[dictionaryElements addObject:[archiveElement toDictionary]];
		}
		dictionary[@"archive"] = dictionaryElements;
	}
	if(self.movie != nil){
		dictionary[@"movie"] = self.movie;
	}
	if(self.season != nil){
		dictionary[@"season"] = self.season;
	}
	if(self.sp != nil){
		dictionary[@"sp"] = self.sp;
	}
	if(self.upper != nil){
		dictionary[@"upper"] = self.upper;
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
	if(self.archive != nil){
		[aCoder encodeObject:self.archive forKey:@"archive"];
	}
	if(self.movie != nil){
		[aCoder encodeObject:self.movie forKey:@"movie"];
	}
	if(self.season != nil){
		[aCoder encodeObject:self.season forKey:@"season"];
	}
	if(self.sp != nil){
		[aCoder encodeObject:self.sp forKey:@"sp"];
	}
	if(self.upper != nil){
		[aCoder encodeObject:self.upper forKey:@"upper"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.archive = [aDecoder decodeObjectForKey:@"archive"];
	self.movie = [aDecoder decodeObjectForKey:@"movie"];
	self.season = [aDecoder decodeObjectForKey:@"season"];
	self.sp = [aDecoder decodeObjectForKey:@"sp"];
	self.upper = [aDecoder decodeObjectForKey:@"upper"];
	return self;

}
@end