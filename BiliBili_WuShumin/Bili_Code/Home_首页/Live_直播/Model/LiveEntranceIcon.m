//
//	LiveEntranceIcon.m
//
//	Create by 书敏 吴 on 27/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LiveEntranceIcon.h"

@interface LiveEntranceIcon ()
@end
@implementation LiveEntranceIcon




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"entrance_icon"] isKindOfClass:[NSNull class]]){
		self.entranceIcon = [[EntranceIcon alloc] initWithDictionary:dictionary[@"entrance_icon"]];
	}

	if(![dictionary[@"id"] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[@"id"] integerValue];
	}

	if(![dictionary[@"name"] isKindOfClass:[NSNull class]]){
		self.name = dictionary[@"name"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.entranceIcon != nil){
		dictionary[@"entrance_icon"] = [self.entranceIcon toDictionary];
	}
	dictionary[@"id"] = @(self.idField);
	if(self.name != nil){
		dictionary[@"name"] = self.name;
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
	if(self.entranceIcon != nil){
		[aCoder encodeObject:self.entranceIcon forKey:@"entrance_icon"];
	}
	[aCoder encodeObject:@(self.idField) forKey:@"id"];	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:@"name"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.entranceIcon = [aDecoder decodeObjectForKey:@"entrance_icon"];
	self.idField = [[aDecoder decodeObjectForKey:@"id"] integerValue];
	self.name = [aDecoder decodeObjectForKey:@"name"];
	return self;

}
@end