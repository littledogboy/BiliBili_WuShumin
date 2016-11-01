//
//	LiveRecommendRecommendData.m
//
//	Create by 书敏 吴 on 27/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LiveRecommendRecommendData.h"

@interface LiveRecommendRecommendData ()
@end
@implementation LiveRecommendRecommendData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[@"banner_data"] != nil && [dictionary[@"banner_data"] isKindOfClass:[NSArray class]]){
		NSArray * bannerDataDictionaries = dictionary[@"banner_data"];
		NSMutableArray * bannerDataItems = [NSMutableArray array];
		for(NSDictionary * bannerDataDictionary in bannerDataDictionaries){
			Live * bannerDataItem = [[Live alloc] initWithDictionary:bannerDataDictionary];
			[bannerDataItems addObject:bannerDataItem];
		}
		self.bannerData = bannerDataItems;
	}
	if(dictionary[@"lives"] != nil && [dictionary[@"lives"] isKindOfClass:[NSArray class]]){
		NSArray * livesDictionaries = dictionary[@"lives"];
		NSMutableArray * livesItems = [NSMutableArray array];
		for(NSDictionary * livesDictionary in livesDictionaries){
			Live * livesItem = [[Live alloc] initWithDictionary:livesDictionary];
			[livesItems addObject:livesItem];
		}
		self.lives = livesItems;
	}
	if(![dictionary[@"partition"] isKindOfClass:[NSNull class]]){
		self.partition = [[LivePartition_Partition alloc] initWithDictionary:dictionary[@"partition"]];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.bannerData != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Live * bannerDataElement in self.bannerData){
			[dictionaryElements addObject:[bannerDataElement toDictionary]];
		}
		dictionary[@"banner_data"] = dictionaryElements;
	}
	if(self.lives != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Live * livesElement in self.lives){
			[dictionaryElements addObject:[livesElement toDictionary]];
		}
		dictionary[@"lives"] = dictionaryElements;
	}
	if(self.partition != nil){
		dictionary[@"partition"] = [self.partition toDictionary];
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
	if(self.bannerData != nil){
		[aCoder encodeObject:self.bannerData forKey:@"banner_data"];
	}
	if(self.lives != nil){
		[aCoder encodeObject:self.lives forKey:@"lives"];
	}
	if(self.partition != nil){
		[aCoder encodeObject:self.partition forKey:@"partition"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.bannerData = [aDecoder decodeObjectForKey:@"banner_data"];
	self.lives = [aDecoder decodeObjectForKey:@"lives"];
	self.partition = [aDecoder decodeObjectForKey:@"partition"];
	return self;

}
@end