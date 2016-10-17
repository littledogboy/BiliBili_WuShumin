//
//	BungumiRecommend.m
//
//	Create by 书敏 吴 on 17/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "BungumiRecommend.h"

@interface BungumiRecommend ()
@end
@implementation BungumiRecommend




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"cover"] isKindOfClass:[NSNull class]]){
		self.cover = dictionary[@"cover"];
	}	
	if(![dictionary[@"cursor"] isKindOfClass:[NSNull class]]){
		self.cursor = [dictionary[@"cursor"] floatValue];
	}

	if(![dictionary[@"desc"] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[@"desc"];
	}	
	if(![dictionary[@"id"] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[@"id"] integerValue];
	}

	if(![dictionary[@"is_new"] isKindOfClass:[NSNull class]]){
		self.isNew = [dictionary[@"is_new"] integerValue];
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
	if(self.cover != nil){
		dictionary[@"cover"] = self.cover;
	}
	dictionary[@"cursor"] = @(self.cursor);
	if(self.desc != nil){
		dictionary[@"desc"] = self.desc;
	}
	dictionary[@"id"] = @(self.idField);
	dictionary[@"is_new"] = @(self.isNew);
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
	if(self.cover != nil){
		[aCoder encodeObject:self.cover forKey:@"cover"];
	}
	[aCoder encodeObject:@(self.cursor) forKey:@"cursor"];	if(self.desc != nil){
		[aCoder encodeObject:self.desc forKey:@"desc"];
	}
	[aCoder encodeObject:@(self.idField) forKey:@"id"];	[aCoder encodeObject:@(self.isNew) forKey:@"is_new"];	if(self.link != nil){
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
	self.cover = [aDecoder decodeObjectForKey:@"cover"];
	self.cursor = [[aDecoder decodeObjectForKey:@"cursor"] floatValue];
	self.desc = [aDecoder decodeObjectForKey:@"desc"];
	self.idField = [[aDecoder decodeObjectForKey:@"id"] integerValue];
	self.isNew = [[aDecoder decodeObjectForKey:@"is_new"] integerValue];
	self.link = [aDecoder decodeObjectForKey:@"link"];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	return self;

}
@end