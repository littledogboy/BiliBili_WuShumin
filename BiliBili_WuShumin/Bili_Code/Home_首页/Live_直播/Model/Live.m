//
//	Live.m
//
//	Create by 书敏 吴 on 27/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Live.h"

@interface Live ()
@end
@implementation Live




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"accept_quality"] isKindOfClass:[NSNull class]]){
		self.acceptQuality = dictionary[@"accept_quality"];
	}	
	if(![dictionary[@"area"] isKindOfClass:[NSNull class]]){
		self.area = dictionary[@"area"];
	}	
	if(![dictionary[@"area_id"] isKindOfClass:[NSNull class]]){
		self.areaId = [dictionary[@"area_id"] integerValue];
	}

	if(![dictionary[@"broadcast_type"] isKindOfClass:[NSNull class]]){
		self.broadcastType = [dictionary[@"broadcast_type"] integerValue];
	}

	if(![dictionary[@"check_version"] isKindOfClass:[NSNull class]]){
		self.checkVersion = [dictionary[@"check_version"] integerValue];
	}

	if(![dictionary[@"cover"] isKindOfClass:[NSNull class]]){
		self.cover = [[LiveCover alloc] initWithDictionary:dictionary[@"cover"]];
	}

	if(![dictionary[@"is_tv"] isKindOfClass:[NSNull class]]){
		self.isTv = [dictionary[@"is_tv"] integerValue];
	}

	if(![dictionary[@"online"] isKindOfClass:[NSNull class]]){
		self.online = [dictionary[@"online"] integerValue];
	}

	if(![dictionary[@"owner"] isKindOfClass:[NSNull class]]){
		self.owner = [[LiveOwner alloc] initWithDictionary:dictionary[@"owner"]];
	}

	if(![dictionary[@"playurl"] isKindOfClass:[NSNull class]]){
		self.playurl = dictionary[@"playurl"];
	}	
	if(![dictionary[@"room_id"] isKindOfClass:[NSNull class]]){
		self.roomId = [dictionary[@"room_id"] integerValue];
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
	if(self.acceptQuality != nil){
		dictionary[@"accept_quality"] = self.acceptQuality;
	}
	if(self.area != nil){
		dictionary[@"area"] = self.area;
	}
	dictionary[@"area_id"] = @(self.areaId);
	dictionary[@"broadcast_type"] = @(self.broadcastType);
	dictionary[@"check_version"] = @(self.checkVersion);
	if(self.cover != nil){
		dictionary[@"cover"] = [self.cover toDictionary];
	}
	dictionary[@"is_tv"] = @(self.isTv);
	dictionary[@"online"] = @(self.online);
	if(self.owner != nil){
		dictionary[@"owner"] = [self.owner toDictionary];
	}
	if(self.playurl != nil){
		dictionary[@"playurl"] = self.playurl;
	}
	dictionary[@"room_id"] = @(self.roomId);
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
	if(self.acceptQuality != nil){
		[aCoder encodeObject:self.acceptQuality forKey:@"accept_quality"];
	}
	if(self.area != nil){
		[aCoder encodeObject:self.area forKey:@"area"];
	}
	[aCoder encodeObject:@(self.areaId) forKey:@"area_id"];	[aCoder encodeObject:@(self.broadcastType) forKey:@"broadcast_type"];	[aCoder encodeObject:@(self.checkVersion) forKey:@"check_version"];	if(self.cover != nil){
		[aCoder encodeObject:self.cover forKey:@"cover"];
	}
	[aCoder encodeObject:@(self.isTv) forKey:@"is_tv"];	[aCoder encodeObject:@(self.online) forKey:@"online"];	if(self.owner != nil){
		[aCoder encodeObject:self.owner forKey:@"owner"];
	}
	if(self.playurl != nil){
		[aCoder encodeObject:self.playurl forKey:@"playurl"];
	}
	[aCoder encodeObject:@(self.roomId) forKey:@"room_id"];	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.acceptQuality = [aDecoder decodeObjectForKey:@"accept_quality"];
	self.area = [aDecoder decodeObjectForKey:@"area"];
	self.areaId = [[aDecoder decodeObjectForKey:@"area_id"] integerValue];
	self.broadcastType = [[aDecoder decodeObjectForKey:@"broadcast_type"] integerValue];
	self.checkVersion = [[aDecoder decodeObjectForKey:@"check_version"] integerValue];
	self.cover = [aDecoder decodeObjectForKey:@"cover"];
	self.isTv = [[aDecoder decodeObjectForKey:@"is_tv"] integerValue];
	self.online = [[aDecoder decodeObjectForKey:@"online"] integerValue];
	self.owner = [aDecoder decodeObjectForKey:@"owner"];
	self.playurl = [aDecoder decodeObjectForKey:@"playurl"];
	self.roomId = [[aDecoder decodeObjectForKey:@"room_id"] integerValue];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	return self;

}
@end