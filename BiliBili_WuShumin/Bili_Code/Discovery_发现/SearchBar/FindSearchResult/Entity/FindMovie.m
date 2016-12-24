//
//	FindMovie.m
//
//	Create by 书敏 吴 on 24/12/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "FindMovie.h"

@interface FindMovie ()
@end
@implementation FindMovie




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"actors"] isKindOfClass:[NSNull class]]){
		self.actors = dictionary[@"actors"];
	}	
	if(![dictionary[@"area"] isKindOfClass:[NSNull class]]){
		self.area = dictionary[@"area"];
	}	
	if(![dictionary[@"cover"] isKindOfClass:[NSNull class]]){
		self.cover = dictionary[@"cover"];
	}	
	if(![dictionary[@"cover_mark"] isKindOfClass:[NSNull class]]){
		self.coverMark = dictionary[@"cover_mark"];
	}	
	if(![dictionary[@"desc"] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[@"desc"];
	}	
	if(![dictionary[@"goto"] isKindOfClass:[NSNull class]]){
		self.gotoField = dictionary[@"goto"];
	}	
	if(![dictionary[@"length"] isKindOfClass:[NSNull class]]){
		self.length = [dictionary[@"length"] integerValue];
	}

	if(![dictionary[@"official_verify"] isKindOfClass:[NSNull class]]){
		self.officialVerify = [[FindOfficialVerify alloc] initWithDictionary:dictionary[@"official_verify"]];
	}

	if(![dictionary[@"param"] isKindOfClass:[NSNull class]]){
		self.param = dictionary[@"param"];
	}	
	if(![dictionary[@"screen_date"] isKindOfClass:[NSNull class]]){
		self.screenDate = dictionary[@"screen_date"];
	}	
	if(![dictionary[@"staff"] isKindOfClass:[NSNull class]]){
		self.staff = dictionary[@"staff"];
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
	if(self.actors != nil){
		dictionary[@"actors"] = self.actors;
	}
	if(self.area != nil){
		dictionary[@"area"] = self.area;
	}
	if(self.cover != nil){
		dictionary[@"cover"] = self.cover;
	}
	if(self.coverMark != nil){
		dictionary[@"cover_mark"] = self.coverMark;
	}
	if(self.desc != nil){
		dictionary[@"desc"] = self.desc;
	}
	if(self.gotoField != nil){
		dictionary[@"goto"] = self.gotoField;
	}
	dictionary[@"length"] = @(self.length);
	if(self.officialVerify != nil){
		dictionary[@"official_verify"] = [self.officialVerify toDictionary];
	}
	if(self.param != nil){
		dictionary[@"param"] = self.param;
	}
	if(self.screenDate != nil){
		dictionary[@"screen_date"] = self.screenDate;
	}
	if(self.staff != nil){
		dictionary[@"staff"] = self.staff;
	}
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
	if(self.actors != nil){
		[aCoder encodeObject:self.actors forKey:@"actors"];
	}
	if(self.area != nil){
		[aCoder encodeObject:self.area forKey:@"area"];
	}
	if(self.cover != nil){
		[aCoder encodeObject:self.cover forKey:@"cover"];
	}
	if(self.coverMark != nil){
		[aCoder encodeObject:self.coverMark forKey:@"cover_mark"];
	}
	if(self.desc != nil){
		[aCoder encodeObject:self.desc forKey:@"desc"];
	}
	if(self.gotoField != nil){
		[aCoder encodeObject:self.gotoField forKey:@"goto"];
	}
	[aCoder encodeObject:@(self.length) forKey:@"length"];	if(self.officialVerify != nil){
		[aCoder encodeObject:self.officialVerify forKey:@"official_verify"];
	}
	if(self.param != nil){
		[aCoder encodeObject:self.param forKey:@"param"];
	}
	if(self.screenDate != nil){
		[aCoder encodeObject:self.screenDate forKey:@"screen_date"];
	}
	if(self.staff != nil){
		[aCoder encodeObject:self.staff forKey:@"staff"];
	}
	[aCoder encodeObject:@(self.status) forKey:@"status"];	if(self.title != nil){
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
	self.actors = [aDecoder decodeObjectForKey:@"actors"];
	self.area = [aDecoder decodeObjectForKey:@"area"];
	self.cover = [aDecoder decodeObjectForKey:@"cover"];
	self.coverMark = [aDecoder decodeObjectForKey:@"cover_mark"];
	self.desc = [aDecoder decodeObjectForKey:@"desc"];
	self.gotoField = [aDecoder decodeObjectForKey:@"goto"];
	self.length = [[aDecoder decodeObjectForKey:@"length"] integerValue];
	self.officialVerify = [aDecoder decodeObjectForKey:@"official_verify"];
	self.param = [aDecoder decodeObjectForKey:@"param"];
	self.screenDate = [aDecoder decodeObjectForKey:@"screen_date"];
	self.staff = [aDecoder decodeObjectForKey:@"staff"];
	self.status = [[aDecoder decodeObjectForKey:@"status"] integerValue];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	self.totalCount = [[aDecoder decodeObjectForKey:@"total_count"] integerValue];
	self.uri = [aDecoder decodeObjectForKey:@"uri"];
	return self;

}
@end