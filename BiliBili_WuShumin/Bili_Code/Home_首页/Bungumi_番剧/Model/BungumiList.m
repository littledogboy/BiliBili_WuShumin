//
//	BungumiList.m
//
//	Create by 书敏 吴 on 14/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "BungumiList.h"

@interface BungumiList ()
@end
@implementation BungumiList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"cover"] isKindOfClass:[NSNull class]]){
		self.cover = dictionary[@"cover"];
	}	
	if(![dictionary[@"favourites"] isKindOfClass:[NSNull class]]){
		self.favourites = dictionary[@"favourites"];
	}	
	if(![dictionary[@"is_finish"] isKindOfClass:[NSNull class]]){
		self.isFinish = [dictionary[@"is_finish"] integerValue];
	}

	if(![dictionary[@"last_time"] isKindOfClass:[NSNull class]]){
		self.lastTime = [dictionary[@"last_time"] integerValue];
	}

	if(![dictionary[@"newest_ep_index"] isKindOfClass:[NSNull class]]){
		self.newestEpIndex = dictionary[@"newest_ep_index"];
	}	
	if(![dictionary[@"pub_time"] isKindOfClass:[NSNull class]]){
		self.pubTime = [dictionary[@"pub_time"] integerValue];
	}

	if(![dictionary[@"season_id"] isKindOfClass:[NSNull class]]){
		self.seasonId = [dictionary[@"season_id"] integerValue];
	}

	if(![dictionary[@"season_status"] isKindOfClass:[NSNull class]]){
		self.seasonStatus = [dictionary[@"season_status"] integerValue];
	}

	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	if(![dictionary[@"watching_count"] isKindOfClass:[NSNull class]]){
		self.watchingCount = [dictionary[@"watching_count"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.cover != nil){
		dictionary[@"cover"] = self.cover;
	}
	if(self.favourites != nil){
		dictionary[@"favourites"] = self.favourites;
	}
	dictionary[@"is_finish"] = @(self.isFinish);
	dictionary[@"last_time"] = @(self.lastTime);
	if(self.newestEpIndex != nil){
		dictionary[@"newest_ep_index"] = self.newestEpIndex;
	}
	dictionary[@"pub_time"] = @(self.pubTime);
	dictionary[@"season_id"] = @(self.seasonId);
	dictionary[@"season_status"] = @(self.seasonStatus);
	if(self.title != nil){
		dictionary[@"title"] = self.title;
	}
	dictionary[@"watching_count"] = @(self.watchingCount);
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
	if(self.cover != nil){
		[aCoder encodeObject:self.cover forKey:@"cover"];
	}
	if(self.favourites != nil){
		[aCoder encodeObject:self.favourites forKey:@"favourites"];
	}
	[aCoder encodeObject:@(self.isFinish) forKey:@"is_finish"];	[aCoder encodeObject:@(self.lastTime) forKey:@"last_time"];	if(self.newestEpIndex != nil){
		[aCoder encodeObject:self.newestEpIndex forKey:@"newest_ep_index"];
	}
	[aCoder encodeObject:@(self.pubTime) forKey:@"pub_time"];	[aCoder encodeObject:@(self.seasonId) forKey:@"season_id"];	[aCoder encodeObject:@(self.seasonStatus) forKey:@"season_status"];	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}
	[aCoder encodeObject:@(self.watchingCount) forKey:@"watching_count"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.cover = [aDecoder decodeObjectForKey:@"cover"];
	self.favourites = [aDecoder decodeObjectForKey:@"favourites"];
	self.isFinish = [[aDecoder decodeObjectForKey:@"is_finish"] integerValue];
	self.lastTime = [[aDecoder decodeObjectForKey:@"last_time"] integerValue];
	self.newestEpIndex = [aDecoder decodeObjectForKey:@"newest_ep_index"];
	self.pubTime = [[aDecoder decodeObjectForKey:@"pub_time"] integerValue];
	self.seasonId = [[aDecoder decodeObjectForKey:@"season_id"] integerValue];
	self.seasonStatus = [[aDecoder decodeObjectForKey:@"season_status"] integerValue];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	self.watchingCount = [[aDecoder decodeObjectForKey:@"watching_count"] integerValue];
	return self;

}
@end