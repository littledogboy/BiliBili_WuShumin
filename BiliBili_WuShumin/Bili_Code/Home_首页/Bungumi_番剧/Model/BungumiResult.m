//
//	BungumiResult.m
//
//	Create by 书敏 吴 on 14/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "BungumiResult.h"

@interface BungumiResult ()
@end
@implementation BungumiResult




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"ad"] isKindOfClass:[NSNull class]]){
		self.ad = [[BungumiAd alloc] initWithDictionary:dictionary[@"ad"]];
	}

	if(![dictionary[@"previous"] isKindOfClass:[NSNull class]]){
		self.previous = [[BungumiPreviou alloc] initWithDictionary:dictionary[@"previous"]];
	}

	if(dictionary[@"serializing"] != nil && [dictionary[@"serializing"] isKindOfClass:[NSArray class]]){
		NSArray * serializingDictionaries = dictionary[@"serializing"];
		NSMutableArray * serializingItems = [NSMutableArray array];
		for(NSDictionary * serializingDictionary in serializingDictionaries){
			BungumiSerializing * serializingItem = [[BungumiSerializing alloc] initWithDictionary:serializingDictionary];
			[serializingItems addObject:serializingItem];
		}
		self.serializing = serializingItems;
	}
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.ad != nil){
		dictionary[@"ad"] = [self.ad toDictionary];
	}
	if(self.previous != nil){
		dictionary[@"previous"] = [self.previous toDictionary];
	}
	if(self.serializing != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(BungumiSerializing * serializingElement in self.serializing){
			[dictionaryElements addObject:[serializingElement toDictionary]];
		}
		dictionary[@"serializing"] = dictionaryElements;
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
	if(self.ad != nil){
		[aCoder encodeObject:self.ad forKey:@"ad"];
	}
	if(self.previous != nil){
		[aCoder encodeObject:self.previous forKey:@"previous"];
	}
	if(self.serializing != nil){
		[aCoder encodeObject:self.serializing forKey:@"serializing"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ad = [aDecoder decodeObjectForKey:@"ad"];
	self.previous = [aDecoder decodeObjectForKey:@"previous"];
	self.serializing = [aDecoder decodeObjectForKey:@"serializing"];
	return self;

}
@end