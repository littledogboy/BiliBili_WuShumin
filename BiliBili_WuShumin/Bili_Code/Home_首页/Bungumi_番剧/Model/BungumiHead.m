//
//	BungumiHead.m
//
//	Create by 书敏 吴 on 14/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "BungumiHead.h"

@interface BungumiHead ()
@end
@implementation BungumiHead




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"id"] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[@"id"] integerValue];
	}

	if(![dictionary[@"img"] isKindOfClass:[NSNull class]]){
		self.img = dictionary[@"img"];
	}	
	if(![dictionary[@"is_ad"] isKindOfClass:[NSNull class]]){
		self.isAd = [dictionary[@"is_ad"] integerValue];
	}

	if(![dictionary[@"link"] isKindOfClass:[NSNull class]]){
		self.link = dictionary[@"link"];
	}	
	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"id"] = @(self.idField);
	if(self.img != nil){
		dictionary[@"img"] = self.img;
	}
	dictionary[@"is_ad"] = @(self.isAd);
	if(self.link != nil){
		dictionary[@"link"] = self.link;
	}
	if(self.title != nil){
		dictionary[@"title"] = self.title;
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
	[aCoder encodeObject:@(self.idField) forKey:@"id"];	if(self.img != nil){
		[aCoder encodeObject:self.img forKey:@"img"];
	}
	[aCoder encodeObject:@(self.isAd) forKey:@"is_ad"];	if(self.link != nil){
		[aCoder encodeObject:self.link forKey:@"link"];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [[aDecoder decodeObjectForKey:@"id"] integerValue];
	self.img = [aDecoder decodeObjectForKey:@"img"];
	self.isAd = [[aDecoder decodeObjectForKey:@"is_ad"] integerValue];
	self.link = [aDecoder decodeObjectForKey:@"link"];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	return self;

}
@end