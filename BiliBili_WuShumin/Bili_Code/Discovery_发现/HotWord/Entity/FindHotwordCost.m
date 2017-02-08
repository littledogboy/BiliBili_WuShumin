//
//	FindHotwordCost.m
//
//	Create by 书敏 吴 on 5/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "FindHotwordCost.h"

@interface FindHotwordCost ()
@end
@implementation FindHotwordCost




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"readfile"] isKindOfClass:[NSNull class]]){
		self.readfile = dictionary[@"readfile"];
	}	
	if(![dictionary[@"timer"] isKindOfClass:[NSNull class]]){
		self.timer = dictionary[@"timer"];
	}	
	if(![dictionary[@"total"] isKindOfClass:[NSNull class]]){
		self.total = dictionary[@"total"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.readfile != nil){
		dictionary[@"readfile"] = self.readfile;
	}
	if(self.timer != nil){
		dictionary[@"timer"] = self.timer;
	}
	if(self.total != nil){
		dictionary[@"total"] = self.total;
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
	if(self.readfile != nil){
		[aCoder encodeObject:self.readfile forKey:@"readfile"];
	}
	if(self.timer != nil){
		[aCoder encodeObject:self.timer forKey:@"timer"];
	}
	if(self.total != nil){
		[aCoder encodeObject:self.total forKey:@"total"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.readfile = [aDecoder decodeObjectForKey:@"readfile"];
	self.timer = [aDecoder decodeObjectForKey:@"timer"];
	self.total = [aDecoder decodeObjectForKey:@"total"];
	return self;

}
@end