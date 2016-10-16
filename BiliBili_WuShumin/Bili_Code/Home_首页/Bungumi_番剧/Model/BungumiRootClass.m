//
//	BungumiRootClass.m
//
//	Create by 书敏 吴 on 14/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "BungumiRootClass.h"

@interface BungumiRootClass ()
@end
@implementation BungumiRootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"code"] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[@"code"] integerValue];
	}

	if(![dictionary[@"message"] isKindOfClass:[NSNull class]]){
		self.message = dictionary[@"message"];
	}	
	if(![dictionary[@"result"] isKindOfClass:[NSNull class]]){
		self.result = [[BungumiResult alloc] initWithDictionary:dictionary[@"result"]];
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
	if(self.message != nil){
		dictionary[@"message"] = self.message;
	}
	if(self.result != nil){
		dictionary[@"result"] = [self.result toDictionary];
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
	[aCoder encodeObject:@(self.code) forKey:@"code"];	if(self.message != nil){
		[aCoder encodeObject:self.message forKey:@"message"];
	}
	if(self.result != nil){
		[aCoder encodeObject:self.result forKey:@"result"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [[aDecoder decodeObjectForKey:@"code"] integerValue];
	self.message = [aDecoder decodeObjectForKey:@"message"];
	self.result = [aDecoder decodeObjectForKey:@"result"];
	return self;

}
@end