//
//	FindHotwordEntity.m
//
//	Create by 书敏 吴 on 5/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "FindHotwordEntity.h"

@interface FindHotwordEntity ()
@end
@implementation FindHotwordEntity




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"code"] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[@"code"] integerValue];
	}

	if(![dictionary[@"cost"] isKindOfClass:[NSNull class]]){
		self.cost = [[FindHotwordCost alloc] initWithDictionary:dictionary[@"cost"]];
	}

	if(dictionary[@"list"] != nil && [dictionary[@"list"] isKindOfClass:[NSArray class]]){
		NSArray * listDictionaries = dictionary[@"list"];
		NSMutableArray * listItems = [NSMutableArray array];
		for(NSDictionary * listDictionary in listDictionaries){
			FindHotwordList * listItem = [[FindHotwordList alloc] initWithDictionary:listDictionary];
			[listItems addObject:listItem];
		}
		self.list = listItems;
	}
	if(![dictionary[@"message"] isKindOfClass:[NSNull class]]){
		self.message = dictionary[@"message"];
	}	
	if(![dictionary[@"seid"] isKindOfClass:[NSNull class]]){
		self.seid = dictionary[@"seid"];
	}	
	if(![dictionary[@"timestamp"] isKindOfClass:[NSNull class]]){
		self.timestamp = [dictionary[@"timestamp"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"code"] = @(self.code);
	if(self.cost != nil){
		dictionary[@"cost"] = [self.cost toDictionary];
	}
	if(self.list != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(FindHotwordList * listElement in self.list){
			[dictionaryElements addObject:[listElement toDictionary]];
		}
		dictionary[@"list"] = dictionaryElements;
	}
	if(self.message != nil){
		dictionary[@"message"] = self.message;
	}
	if(self.seid != nil){
		dictionary[@"seid"] = self.seid;
	}
	dictionary[@"timestamp"] = @(self.timestamp);
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
	[aCoder encodeObject:@(self.code) forKey:@"code"];	if(self.cost != nil){
		[aCoder encodeObject:self.cost forKey:@"cost"];
	}
	if(self.list != nil){
		[aCoder encodeObject:self.list forKey:@"list"];
	}
	if(self.message != nil){
		[aCoder encodeObject:self.message forKey:@"message"];
	}
	if(self.seid != nil){
		[aCoder encodeObject:self.seid forKey:@"seid"];
	}
	[aCoder encodeObject:@(self.timestamp) forKey:@"timestamp"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [[aDecoder decodeObjectForKey:@"code"] integerValue];
	self.cost = [aDecoder decodeObjectForKey:@"cost"];
	self.list = [aDecoder decodeObjectForKey:@"list"];
	self.message = [aDecoder decodeObjectForKey:@"message"];
	self.seid = [aDecoder decodeObjectForKey:@"seid"];
	self.timestamp = [[aDecoder decodeObjectForKey:@"timestamp"] integerValue];
	return self;

}
@end