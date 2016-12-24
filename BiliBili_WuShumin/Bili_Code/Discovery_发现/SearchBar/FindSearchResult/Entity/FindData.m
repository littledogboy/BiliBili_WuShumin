//
//	FindData.m
//
//	Create by 书敏 吴 on 24/12/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "FindData.h"

@interface FindData ()
@end
@implementation FindData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"items"] isKindOfClass:[NSNull class]]){
		self.items = [[FindItem alloc] initWithDictionary:dictionary[@"items"]];
	}

	if(dictionary[@"nav"] != nil && [dictionary[@"nav"] isKindOfClass:[NSArray class]]){
		NSArray * navDictionaries = dictionary[@"nav"];
		NSMutableArray * navItems = [NSMutableArray array];
		for(NSDictionary * navDictionary in navDictionaries){
			FindNav * navItem = [[FindNav alloc] initWithDictionary:navDictionary];
			[navItems addObject:navItem];
		}
		self.nav = navItems;
	}
	if(![dictionary[@"page"] isKindOfClass:[NSNull class]]){
		self.page = [dictionary[@"page"] integerValue];
	}

	if(![dictionary[@"trackid"] isKindOfClass:[NSNull class]]){
		self.trackid = dictionary[@"trackid"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.items != nil){
		dictionary[@"items"] = [self.items toDictionary];
	}
	if(self.nav != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(FindNav * navElement in self.nav){
			[dictionaryElements addObject:[navElement toDictionary]];
		}
		dictionary[@"nav"] = dictionaryElements;
	}
	dictionary[@"page"] = @(self.page);
	if(self.trackid != nil){
		dictionary[@"trackid"] = self.trackid;
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
	if(self.items != nil){
		[aCoder encodeObject:self.items forKey:@"items"];
	}
	if(self.nav != nil){
		[aCoder encodeObject:self.nav forKey:@"nav"];
	}
	[aCoder encodeObject:@(self.page) forKey:@"page"];	if(self.trackid != nil){
		[aCoder encodeObject:self.trackid forKey:@"trackid"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.items = [aDecoder decodeObjectForKey:@"items"];
	self.nav = [aDecoder decodeObjectForKey:@"nav"];
	self.page = [[aDecoder decodeObjectForKey:@"page"] integerValue];
	self.trackid = [aDecoder decodeObjectForKey:@"trackid"];
	return self;

}
@end