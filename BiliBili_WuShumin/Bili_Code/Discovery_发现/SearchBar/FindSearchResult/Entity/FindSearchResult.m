//
//	FindSearchResult.m
//
//	Create by 书敏 吴 on 24/12/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "FindSearchResult.h"

@interface FindSearchResult ()
@end
@implementation FindSearchResult




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"code"] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[@"code"] integerValue];
	}

	if(![dictionary[@"data"] isKindOfClass:[NSNull class]]){
		self.data = [[FindData alloc] initWithDictionary:dictionary[@"data"]];
	}

	if(![dictionary[@"message"] isKindOfClass:[NSNull class]]){
		self.message = dictionary[@"message"];
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
	if(self.data != nil){
		dictionary[@"data"] = [self.data toDictionary];
	}
	if(self.message != nil){
		dictionary[@"message"] = self.message;
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
	[aCoder encodeObject:@(self.code) forKey:@"code"];	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:@"data"];
	}
	if(self.message != nil){
		[aCoder encodeObject:self.message forKey:@"message"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [[aDecoder decodeObjectForKey:@"code"] integerValue];
	self.data = [aDecoder decodeObjectForKey:@"data"];
	self.message = [aDecoder decodeObjectForKey:@"message"];
	return self;

}
@end