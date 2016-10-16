//
//	BungumiAd.m
//
//	Create by 书敏 吴 on 14/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "BungumiAd.h"

@interface BungumiAd ()
@end
@implementation BungumiAd




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"body"] isKindOfClass:[NSNull class]]){
		self.body = dictionary[@"body"];
	}	
	if(dictionary[@"head"] != nil && [dictionary[@"head"] isKindOfClass:[NSArray class]]){
		NSArray * headDictionaries = dictionary[@"head"];
		NSMutableArray * headItems = [NSMutableArray array];
		for(NSDictionary * headDictionary in headDictionaries){
			BungumiHead * headItem = [[BungumiHead alloc] initWithDictionary:headDictionary];
			[headItems addObject:headItem];
		}
		self.head = headItems;
	}
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.body != nil){
		dictionary[@"body"] = self.body;
	}
	if(self.head != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(BungumiHead * headElement in self.head){
			[dictionaryElements addObject:[headElement toDictionary]];
		}
		dictionary[@"head"] = dictionaryElements;
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
	if(self.body != nil){
		[aCoder encodeObject:self.body forKey:@"body"];
	}
	if(self.head != nil){
		[aCoder encodeObject:self.head forKey:@"head"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.body = [aDecoder decodeObjectForKey:@"body"];
	self.head = [aDecoder decodeObjectForKey:@"head"];
	return self;

}
@end