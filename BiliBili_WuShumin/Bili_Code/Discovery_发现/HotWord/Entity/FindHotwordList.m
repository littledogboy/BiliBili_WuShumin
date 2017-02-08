//
//	FindHotwordList.m
//
//	Create by 书敏 吴 on 5/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "FindHotwordList.h"

@interface FindHotwordList ()
@end
@implementation FindHotwordList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"keyword"] isKindOfClass:[NSNull class]]){
		self.keyword = dictionary[@"keyword"];
	}	
	if(![dictionary[@"status"] isKindOfClass:[NSNull class]]){
		self.status = dictionary[@"status"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.keyword != nil){
		dictionary[@"keyword"] = self.keyword;
	}
	if(self.status != nil){
		dictionary[@"status"] = self.status;
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
	if(self.keyword != nil){
		[aCoder encodeObject:self.keyword forKey:@"keyword"];
	}
	if(self.status != nil){
		[aCoder encodeObject:self.status forKey:@"status"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.keyword = [aDecoder decodeObjectForKey:@"keyword"];
	self.status = [aDecoder decodeObjectForKey:@"status"];
	return self;

}
@end