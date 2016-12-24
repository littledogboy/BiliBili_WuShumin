//
//	FindArchive.m
//
//	Create by 书敏 吴 on 24/12/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "FindArchive.h"

@interface FindArchive ()
@end
@implementation FindArchive




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"author"] isKindOfClass:[NSNull class]]){
		self.author = dictionary[@"author"];
	}	
	if(![dictionary[@"cover"] isKindOfClass:[NSNull class]]){
		self.cover = dictionary[@"cover"];
	}	
	if(![dictionary[@"danmaku"] isKindOfClass:[NSNull class]]){
		self.danmaku = [dictionary[@"danmaku"] integerValue];
	}

	if(![dictionary[@"desc"] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[@"desc"];
	}	
	if(![dictionary[@"duration"] isKindOfClass:[NSNull class]]){
		self.duration = dictionary[@"duration"];
	}	
	if(![dictionary[@"goto"] isKindOfClass:[NSNull class]]){
		self.gotoField = dictionary[@"goto"];
	}	
	if(![dictionary[@"official_verify"] isKindOfClass:[NSNull class]]){
		self.officialVerify = [[FindOfficialVerify alloc] initWithDictionary:dictionary[@"official_verify"]];
	}

	if(![dictionary[@"param"] isKindOfClass:[NSNull class]]){
		self.param = dictionary[@"param"];
	}	
	if(![dictionary[@"play"] isKindOfClass:[NSNull class]]){
		self.play = [dictionary[@"play"] integerValue];
	}

	if(![dictionary[@"status"] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[@"status"] integerValue];
	}

	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	if(![dictionary[@"total_count"] isKindOfClass:[NSNull class]]){
		self.totalCount = [dictionary[@"total_count"] integerValue];
	}

	if(![dictionary[@"uri"] isKindOfClass:[NSNull class]]){
		self.uri = dictionary[@"uri"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.author != nil){
		dictionary[@"author"] = self.author;
	}
	if(self.cover != nil){
		dictionary[@"cover"] = self.cover;
	}
	dictionary[@"danmaku"] = @(self.danmaku);
	if(self.desc != nil){
		dictionary[@"desc"] = self.desc;
	}
	if(self.duration != nil){
		dictionary[@"duration"] = self.duration;
	}
	if(self.gotoField != nil){
		dictionary[@"goto"] = self.gotoField;
	}
	if(self.officialVerify != nil){
		dictionary[@"official_verify"] = [self.officialVerify toDictionary];
	}
	if(self.param != nil){
		dictionary[@"param"] = self.param;
	}
	dictionary[@"play"] = @(self.play);
	dictionary[@"status"] = @(self.status);
	if(self.title != nil){
		dictionary[@"title"] = self.title;
	}
	dictionary[@"total_count"] = @(self.totalCount);
	if(self.uri != nil){
		dictionary[@"uri"] = self.uri;
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
	if(self.author != nil){
		[aCoder encodeObject:self.author forKey:@"author"];
	}
	if(self.cover != nil){
		[aCoder encodeObject:self.cover forKey:@"cover"];
	}
	[aCoder encodeObject:@(self.danmaku) forKey:@"danmaku"];	if(self.desc != nil){
		[aCoder encodeObject:self.desc forKey:@"desc"];
	}
	if(self.duration != nil){
		[aCoder encodeObject:self.duration forKey:@"duration"];
	}
	if(self.gotoField != nil){
		[aCoder encodeObject:self.gotoField forKey:@"goto"];
	}
	if(self.officialVerify != nil){
		[aCoder encodeObject:self.officialVerify forKey:@"official_verify"];
	}
	if(self.param != nil){
		[aCoder encodeObject:self.param forKey:@"param"];
	}
	[aCoder encodeObject:@(self.play) forKey:@"play"];	[aCoder encodeObject:@(self.status) forKey:@"status"];	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}
	[aCoder encodeObject:@(self.totalCount) forKey:@"total_count"];	if(self.uri != nil){
		[aCoder encodeObject:self.uri forKey:@"uri"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.author = [aDecoder decodeObjectForKey:@"author"];
	self.cover = [aDecoder decodeObjectForKey:@"cover"];
	self.danmaku = [[aDecoder decodeObjectForKey:@"danmaku"] integerValue];
	self.desc = [aDecoder decodeObjectForKey:@"desc"];
	self.duration = [aDecoder decodeObjectForKey:@"duration"];
	self.gotoField = [aDecoder decodeObjectForKey:@"goto"];
	self.officialVerify = [aDecoder decodeObjectForKey:@"official_verify"];
	self.param = [aDecoder decodeObjectForKey:@"param"];
	self.play = [[aDecoder decodeObjectForKey:@"play"] integerValue];
	self.status = [[aDecoder decodeObjectForKey:@"status"] integerValue];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	self.totalCount = [[aDecoder decodeObjectForKey:@"total_count"] integerValue];
	self.uri = [aDecoder decodeObjectForKey:@"uri"];
	return self;

}
@end