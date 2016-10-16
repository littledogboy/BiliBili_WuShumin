//
//	BungumiPreviou.m
//
//	Create by 书敏 吴 on 14/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "BungumiPreviou.h"

@interface BungumiPreviou ()
@end
@implementation BungumiPreviou




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[@"list"] != nil && [dictionary[@"list"] isKindOfClass:[NSArray class]]){
		NSArray * listDictionaries = dictionary[@"list"];
		NSMutableArray * listItems = [NSMutableArray array];
		for(NSDictionary * listDictionary in listDictionaries){
			BungumiList * listItem = [[BungumiList alloc] initWithDictionary:listDictionary];
			[listItems addObject:listItem];
		}
		self.list = listItems;
	}
	if(![dictionary[@"season"] isKindOfClass:[NSNull class]]){
		self.season = [dictionary[@"season"] integerValue];
	}

	if(![dictionary[@"year"] isKindOfClass:[NSNull class]]){
		self.year = [dictionary[@"year"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.list != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(BungumiList * listElement in self.list){
			[dictionaryElements addObject:[listElement toDictionary]];
		}
		dictionary[@"list"] = dictionaryElements;
	}
	dictionary[@"season"] = @(self.season);
	dictionary[@"year"] = @(self.year);
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
	if(self.list != nil){
		[aCoder encodeObject:self.list forKey:@"list"];
	}
	[aCoder encodeObject:@(self.season) forKey:@"season"];	[aCoder encodeObject:@(self.year) forKey:@"year"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.list = [aDecoder decodeObjectForKey:@"list"];
	self.season = [[aDecoder decodeObjectForKey:@"season"] integerValue];
	self.year = [[aDecoder decodeObjectForKey:@"year"] integerValue];
	return self;

}
@end