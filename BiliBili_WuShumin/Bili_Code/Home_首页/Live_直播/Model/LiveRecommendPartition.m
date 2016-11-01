//
//	LiveRecommendPartition.m
//
//	Create by 书敏 吴 on 27/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LiveRecommendPartition.h"

@interface LiveRecommendPartition ()
@end
@implementation LiveRecommendPartition




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"area"] isKindOfClass:[NSNull class]]){
		self.area = dictionary[@"area"];
	}	
	if(![dictionary[@"count"] isKindOfClass:[NSNull class]]){
		self.count = [dictionary[@"count"] integerValue];
	}

	if(![dictionary[@"id"] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[@"id"] integerValue];
	}

	if(![dictionary[@"name"] isKindOfClass:[NSNull class]]){
		self.name = dictionary[@"name"];
	}	
	if(![dictionary[@"sub_icon"] isKindOfClass:[NSNull class]]){
		self.subIcon = [[LiveRecommendSubIcon alloc] initWithDictionary:dictionary[@"sub_icon"]];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.area != nil){
		dictionary[@"area"] = self.area;
	}
	dictionary[@"count"] = @(self.count);
	dictionary[@"id"] = @(self.idField);
	if(self.name != nil){
		dictionary[@"name"] = self.name;
	}
	if(self.subIcon != nil){
		dictionary[@"sub_icon"] = [self.subIcon toDictionary];
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
	if(self.area != nil){
		[aCoder encodeObject:self.area forKey:@"area"];
	}
	[aCoder encodeObject:@(self.count) forKey:@"count"];	[aCoder encodeObject:@(self.idField) forKey:@"id"];	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:@"name"];
	}
	if(self.subIcon != nil){
		[aCoder encodeObject:self.subIcon forKey:@"sub_icon"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.area = [aDecoder decodeObjectForKey:@"area"];
	self.count = [[aDecoder decodeObjectForKey:@"count"] integerValue];
	self.idField = [[aDecoder decodeObjectForKey:@"id"] integerValue];
	self.name = [aDecoder decodeObjectForKey:@"name"];
	self.subIcon = [aDecoder decodeObjectForKey:@"sub_icon"];
	return self;

}
@end