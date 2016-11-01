//
//	LiveSubIcon.m
//
//	Create by 书敏 吴 on 28/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LiveSubIcon.h"

@interface LiveSubIcon ()
@end
@implementation LiveSubIcon




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"height"] isKindOfClass:[NSNull class]]){
		self.height = dictionary[@"height"];
	}	
	if(![dictionary[@"src"] isKindOfClass:[NSNull class]]){
		self.src = dictionary[@"src"];
	}	
	if(![dictionary[@"width"] isKindOfClass:[NSNull class]]){
		self.width = dictionary[@"width"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.height != nil){
		dictionary[@"height"] = self.height;
	}
	if(self.src != nil){
		dictionary[@"src"] = self.src;
	}
	if(self.width != nil){
		dictionary[@"width"] = self.width;
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
	if(self.height != nil){
		[aCoder encodeObject:self.height forKey:@"height"];
	}
	if(self.src != nil){
		[aCoder encodeObject:self.src forKey:@"src"];
	}
	if(self.width != nil){
		[aCoder encodeObject:self.width forKey:@"width"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.height = [aDecoder decodeObjectForKey:@"height"];
	self.src = [aDecoder decodeObjectForKey:@"src"];
	self.width = [aDecoder decodeObjectForKey:@"width"];
	return self;

}
@end