//
//	LiveData.m
//
//	Create by 书敏 吴 on 27/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LiveData.h"

@interface LiveData ()
@end
@implementation LiveData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[@"banner"] != nil && [dictionary[@"banner"] isKindOfClass:[NSArray class]]){
		NSArray * bannerDictionaries = dictionary[@"banner"];
		NSMutableArray * bannerItems = [NSMutableArray array];
		for(NSDictionary * bannerDictionary in bannerDictionaries){
			LiveBanner * bannerItem = [[LiveBanner alloc] initWithDictionary:bannerDictionary];
			[bannerItems addObject:bannerItem];
		}
		self.banner = bannerItems;
	}
	if(dictionary[@"entranceIcons"] != nil && [dictionary[@"entranceIcons"] isKindOfClass:[NSArray class]]){
		NSArray * entranceIconsDictionaries = dictionary[@"entranceIcons"];
		NSMutableArray * entranceIconsItems = [NSMutableArray array];
		for(NSDictionary * entranceIconsDictionary in entranceIconsDictionaries){
			LiveEntranceIcon * entranceIconsItem = [[LiveEntranceIcon alloc] initWithDictionary:entranceIconsDictionary];
			[entranceIconsItems addObject:entranceIconsItem];
		}
		self.entranceIcons = entranceIconsItems;
	}
	if(dictionary[@"partitions"] != nil && [dictionary[@"partitions"] isKindOfClass:[NSArray class]]){
		NSArray * partitionsDictionaries = dictionary[@"partitions"];
		NSMutableArray * partitionsItems = [NSMutableArray array];
		for(NSDictionary * partitionsDictionary in partitionsDictionaries){
			LivePartition * partitionsItem = [[LivePartition alloc] initWithDictionary:partitionsDictionary];
			[partitionsItems addObject:partitionsItem];
		}
		self.partitions = partitionsItems;
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
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(LiveBanner * bannerElement in self.banner){
			[dictionaryElements addObject:[bannerElement toDictionary]];
		}
		dictionary[@"banner"] = dictionaryElements;
	}
	if(self.entranceIcons != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(LiveEntranceIcon * entranceIconsElement in self.entranceIcons){
			[dictionaryElements addObject:[entranceIconsElement toDictionary]];
		}
		dictionary[@"entranceIcons"] = dictionaryElements;
	}
	if(self.partitions != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(LivePartition * partitionsElement in self.partitions){
			[dictionaryElements addObject:[partitionsElement toDictionary]];
		}
		dictionary[@"partitions"] = dictionaryElements;
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
	if(self.entranceIcons != nil){
		[aCoder encodeObject:self.entranceIcons forKey:@"entranceIcons"];
	}
	if(self.partitions != nil){
		[aCoder encodeObject:self.partitions forKey:@"partitions"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.banner = [aDecoder decodeObjectForKey:@"banner"];
	self.entranceIcons = [aDecoder decodeObjectForKey:@"entranceIcons"];
	self.partitions = [aDecoder decodeObjectForKey:@"partitions"];
	return self;

}
@end