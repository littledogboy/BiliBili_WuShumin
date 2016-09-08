//
//	List.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "List.h"

@interface List ()
@end
@implementation List




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"aid"] isKindOfClass:[NSNull class]]){
		self.aid = [dictionary[@"aid"] integerValue];
	}

	if(![dictionary[@"author"] isKindOfClass:[NSNull class]]){
		self.author = dictionary[@"author"];
	}	
	if(![dictionary[@"coins"] isKindOfClass:[NSNull class]]){
		self.coins = [dictionary[@"coins"] integerValue];
	}

	if(![dictionary[@"create"] isKindOfClass:[NSNull class]]){
		self.create = dictionary[@"create"];
	}	
	if(![dictionary[@"credit"] isKindOfClass:[NSNull class]]){
		self.credit = [dictionary[@"credit"] integerValue];
	}

	if(![dictionary[@"description"] isKindOfClass:[NSNull class]]){
		self.descriptionField = dictionary[@"description"];
	}	
	if(![dictionary[@"duration"] isKindOfClass:[NSNull class]]){
		self.duration = dictionary[@"duration"];
	}	
	if(![dictionary[@"favorites"] isKindOfClass:[NSNull class]]){
		self.favorites = [dictionary[@"favorites"] integerValue];
	}

	if(![dictionary[@"mid"] isKindOfClass:[NSNull class]]){
		self.mid = [dictionary[@"mid"] integerValue];
	}

	if(![dictionary[@"pic"] isKindOfClass:[NSNull class]]){
		self.pic = dictionary[@"pic"];
	}	
	if(![dictionary[@"play"] isKindOfClass:[NSNull class]]){
		self.play = [dictionary[@"play"] integerValue];
	}

	if(![dictionary[@"pubdate"] isKindOfClass:[NSNull class]]){
		self.pubdate = dictionary[@"pubdate"];
	}	
	if(![dictionary[@"review"] isKindOfClass:[NSNull class]]){
		self.review = [dictionary[@"review"] integerValue];
	}

	if(![dictionary[@"subtitle"] isKindOfClass:[NSNull class]]){
		self.subtitle = dictionary[@"subtitle"];
	}	
	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	if(![dictionary[@"typeid"] isKindOfClass:[NSNull class]]){
		self.typeid = [dictionary[@"typeid"] integerValue];
	}

	if(![dictionary[@"video_review"] isKindOfClass:[NSNull class]]){
		self.videoReview = [dictionary[@"video_review"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"aid"] = @(self.aid);
	if(self.author != nil){
		dictionary[@"author"] = self.author;
	}
	dictionary[@"coins"] = @(self.coins);
	if(self.create != nil){
		dictionary[@"create"] = self.create;
	}
	dictionary[@"credit"] = @(self.credit);
	if(self.descriptionField != nil){
		dictionary[@"description"] = self.descriptionField;
	}
	if(self.duration != nil){
		dictionary[@"duration"] = self.duration;
	}
	dictionary[@"favorites"] = @(self.favorites);
	dictionary[@"mid"] = @(self.mid);
	if(self.pic != nil){
		dictionary[@"pic"] = self.pic;
	}
	dictionary[@"play"] = @(self.play);
	if(self.pubdate != nil){
		dictionary[@"pubdate"] = self.pubdate;
	}
	dictionary[@"review"] = @(self.review);
	if(self.subtitle != nil){
		dictionary[@"subtitle"] = self.subtitle;
	}
	if(self.title != nil){
		dictionary[@"title"] = self.title;
	}
	dictionary[@"typeid"] = @(self.typeid);
	dictionary[@"video_review"] = @(self.videoReview);
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
	[aCoder encodeObject:@(self.aid) forKey:@"aid"];	if(self.author != nil){
		[aCoder encodeObject:self.author forKey:@"author"];
	}
	[aCoder encodeObject:@(self.coins) forKey:@"coins"];	if(self.create != nil){
		[aCoder encodeObject:self.create forKey:@"create"];
	}
	[aCoder encodeObject:@(self.credit) forKey:@"credit"];	if(self.descriptionField != nil){
		[aCoder encodeObject:self.descriptionField forKey:@"description"];
	}
	if(self.duration != nil){
		[aCoder encodeObject:self.duration forKey:@"duration"];
	}
	[aCoder encodeObject:@(self.favorites) forKey:@"favorites"];	[aCoder encodeObject:@(self.mid) forKey:@"mid"];	if(self.pic != nil){
		[aCoder encodeObject:self.pic forKey:@"pic"];
	}
	[aCoder encodeObject:@(self.play) forKey:@"play"];	if(self.pubdate != nil){
		[aCoder encodeObject:self.pubdate forKey:@"pubdate"];
	}
	[aCoder encodeObject:@(self.review) forKey:@"review"];	if(self.subtitle != nil){
		[aCoder encodeObject:self.subtitle forKey:@"subtitle"];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}
	[aCoder encodeObject:@(self.typeid) forKey:@"typeid"];	[aCoder encodeObject:@(self.videoReview) forKey:@"video_review"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.aid = [[aDecoder decodeObjectForKey:@"aid"] integerValue];
	self.author = [aDecoder decodeObjectForKey:@"author"];
	self.coins = [[aDecoder decodeObjectForKey:@"coins"] integerValue];
	self.create = [aDecoder decodeObjectForKey:@"create"];
	self.credit = [[aDecoder decodeObjectForKey:@"credit"] integerValue];
	self.descriptionField = [aDecoder decodeObjectForKey:@"description"];
	self.duration = [aDecoder decodeObjectForKey:@"duration"];
	self.favorites = [[aDecoder decodeObjectForKey:@"favorites"] integerValue];
	self.mid = [[aDecoder decodeObjectForKey:@"mid"] integerValue];
	self.pic = [aDecoder decodeObjectForKey:@"pic"];
	self.play = [[aDecoder decodeObjectForKey:@"play"] integerValue];
	self.pubdate = [aDecoder decodeObjectForKey:@"pubdate"];
	self.review = [[aDecoder decodeObjectForKey:@"review"] integerValue];
	self.subtitle = [aDecoder decodeObjectForKey:@"subtitle"];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	self.typeid = [[aDecoder decodeObjectForKey:@"typeid"] integerValue];
	self.videoReview = [[aDecoder decodeObjectForKey:@"video_review"] integerValue];
	return self;

}
@end