//
//	LiveCover.m
//
//	Create by 书敏 吴 on 27/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LiveCover.h"

@interface LiveCover ()
@end
@implementation LiveCover




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"height"] isKindOfClass:[NSNull class]]){
		self.height = [dictionary[@"height"] integerValue];
	}

	if(![dictionary[@"src"] isKindOfClass:[NSNull class]]){
		self.src = dictionary[@"src"];
	}	
	if(![dictionary[@"width"] isKindOfClass:[NSNull class]]){
		self.width = [dictionary[@"width"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"height"] = @(self.height);
	if(self.src != nil){
		dictionary[@"src"] = self.src;
	}
	dictionary[@"width"] = @(self.width);
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
	[aCoder encodeObject:@(self.height) forKey:@"height"];	if(self.src != nil){
		[aCoder encodeObject:self.src forKey:@"src"];
	}
	[aCoder encodeObject:@(self.width) forKey:@"width"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.height = [[aDecoder decodeObjectForKey:@"height"] integerValue];
	self.src = [aDecoder decodeObjectForKey:@"src"];
	self.width = [[aDecoder decodeObjectForKey:@"width"] integerValue];
	return self;

}
@end