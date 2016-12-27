//
//	FindSeason.m
//
//	Create by 书敏 吴 on 26/12/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "FindSeason.h"

@interface FindSeason ()
@end
@implementation FindSeason




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"cat_desc"] isKindOfClass:[NSNull class]]){
		self.catDesc = dictionary[@"cat_desc"];
	}	
	if(![dictionary[@"cover"] isKindOfClass:[NSNull class]]){
		self.cover = dictionary[@"cover"];
	}	
	if(![dictionary[@"finish"] isKindOfClass:[NSNull class]]){
		self.finish = [dictionary[@"finish"] integerValue];
	}

	if(![dictionary[@"goto"] isKindOfClass:[NSNull class]]){
		self.gotoField = dictionary[@"goto"];
	}	
	if(![dictionary[@"index"] isKindOfClass:[NSNull class]]){
		self.index = dictionary[@"index"];
	}	
	if(![dictionary[@"newest_cat"] isKindOfClass:[NSNull class]]){
		self.newestCat = dictionary[@"newest_cat"];
	}	
	if(![dictionary[@"newest_season"] isKindOfClass:[NSNull class]]){
		self.newestSeason = dictionary[@"newest_season"];
	}	
	if(![dictionary[@"official_verify"] isKindOfClass:[NSNull class]]){
		self.officialVerify = [[FindOfficialVerify alloc] initWithDictionary:dictionary[@"official_verify"]];
	}

	if(![dictionary[@"param"] isKindOfClass:[NSNull class]]){
		self.param = dictionary[@"param"];
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
	if(self.catDesc != nil){
		dictionary[@"cat_desc"] = self.catDesc;
	}
	if(self.cover != nil){
		dictionary[@"cover"] = self.cover;
	}
	dictionary[@"finish"] = @(self.finish);
	if(self.gotoField != nil){
		dictionary[@"goto"] = self.gotoField;
	}
	if(self.index != nil){
		dictionary[@"index"] = self.index;
	}
	if(self.newestCat != nil){
		dictionary[@"newest_cat"] = self.newestCat;
	}
	if(self.newestSeason != nil){
		dictionary[@"newest_season"] = self.newestSeason;
	}
	if(self.officialVerify != nil){
		dictionary[@"official_verify"] = [self.officialVerify toDictionary];
	}
	if(self.param != nil){
		dictionary[@"param"] = self.param;
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
	if(self.catDesc != nil){
		[aCoder encodeObject:self.catDesc forKey:@"cat_desc"];
	}
	if(self.cover != nil){
		[aCoder encodeObject:self.cover forKey:@"cover"];
	}
	[aCoder encodeObject:@(self.finish) forKey:@"finish"];	if(self.gotoField != nil){
		[aCoder encodeObject:self.gotoField forKey:@"goto"];
	}
	if(self.index != nil){
		[aCoder encodeObject:self.index forKey:@"index"];
	}
	if(self.newestCat != nil){
		[aCoder encodeObject:self.newestCat forKey:@"newest_cat"];
	}
	if(self.newestSeason != nil){
		[aCoder encodeObject:self.newestSeason forKey:@"newest_season"];
	}
	if(self.officialVerify != nil){
		[aCoder encodeObject:self.officialVerify forKey:@"official_verify"];
	}
	if(self.param != nil){
		[aCoder encodeObject:self.param forKey:@"param"];
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
	self.catDesc = [aDecoder decodeObjectForKey:@"cat_desc"];
	self.cover = [aDecoder decodeObjectForKey:@"cover"];
	self.finish = [[aDecoder decodeObjectForKey:@"finish"] integerValue];
	self.gotoField = [aDecoder decodeObjectForKey:@"goto"];
	self.index = [aDecoder decodeObjectForKey:@"index"];
	self.newestCat = [aDecoder decodeObjectForKey:@"newest_cat"];
	self.newestSeason = [aDecoder decodeObjectForKey:@"newest_season"];
	self.officialVerify = [aDecoder decodeObjectForKey:@"official_verify"];
	self.param = [aDecoder decodeObjectForKey:@"param"];
	self.status = [[aDecoder decodeObjectForKey:@"status"] integerValue];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	self.totalCount = [[aDecoder decodeObjectForKey:@"total_count"] integerValue];
	self.uri = [aDecoder decodeObjectForKey:@"uri"];
	return self;

}
@end