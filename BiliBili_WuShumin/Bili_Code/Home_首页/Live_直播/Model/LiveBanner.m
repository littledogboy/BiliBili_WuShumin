//
//	LiveBanner.m
//
//	Create by 书敏 吴 on 27/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LiveBanner.h"

@interface LiveBanner ()
@end
@implementation LiveBanner




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"img"] isKindOfClass:[NSNull class]]){
		self.img = dictionary[@"img"];
	}	
	if(![dictionary[@"link"] isKindOfClass:[NSNull class]]){
		self.link = dictionary[@"link"];
	}	
	if(![dictionary[@"remark"] isKindOfClass:[NSNull class]]){
		self.remark = dictionary[@"remark"];
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
	if(self.img != nil){
		dictionary[@"img"] = self.img;
	}
	if(self.link != nil){
		dictionary[@"link"] = self.link;
	}
	if(self.remark != nil){
		dictionary[@"remark"] = self.remark;
	}
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
	if(self.img != nil){
		[aCoder encodeObject:self.img forKey:@"img"];
	}
	if(self.link != nil){
		[aCoder encodeObject:self.link forKey:@"link"];
	}
	if(self.remark != nil){
		[aCoder encodeObject:self.remark forKey:@"remark"];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.img = [aDecoder decodeObjectForKey:@"img"];
	self.link = [aDecoder decodeObjectForKey:@"link"];
	self.remark = [aDecoder decodeObjectForKey:@"remark"];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	return self;

}
@end