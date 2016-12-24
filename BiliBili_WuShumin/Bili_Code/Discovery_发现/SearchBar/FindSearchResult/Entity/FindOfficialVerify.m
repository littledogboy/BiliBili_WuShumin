//
//	FindOfficialVerify.m
//
//	Create by 书敏 吴 on 24/12/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "FindOfficialVerify.h"

@interface FindOfficialVerify ()
@end
@implementation FindOfficialVerify




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"desc"] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[@"desc"];
	}	
	if(![dictionary[@"type"] isKindOfClass:[NSNull class]]){
		self.type = [dictionary[@"type"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.desc != nil){
		dictionary[@"desc"] = self.desc;
	}
	dictionary[@"type"] = @(self.type);
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
	if(self.desc != nil){
		[aCoder encodeObject:self.desc forKey:@"desc"];
	}
	[aCoder encodeObject:@(self.type) forKey:@"type"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.desc = [aDecoder decodeObjectForKey:@"desc"];
	self.type = [[aDecoder decodeObjectForKey:@"type"] integerValue];
	return self;

}
@end