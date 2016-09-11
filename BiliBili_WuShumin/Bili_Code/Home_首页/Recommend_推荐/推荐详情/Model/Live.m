//
//	Live.m
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
	if(![dictionary[@"mid"] isKindOfClass:[NSNull class]]){
		self.mid = [dictionary[@"mid"] integerValue];
	}

	if(![dictionary[@"roomid"] isKindOfClass:[NSNull class]]){
		self.roomid = [dictionary[@"roomid"] integerValue];
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
	dictionary[@"mid"] = @(self.mid);
	dictionary[@"roomid"] = @(self.roomid);
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
	[aCoder encodeObject:@(self.mid) forKey:@"mid"];	[aCoder encodeObject:@(self.roomid) forKey:@"roomid"];	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.mid = [[aDecoder decodeObjectForKey:@"mid"] integerValue];
	self.roomid = [[aDecoder decodeObjectForKey:@"roomid"] integerValue];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	return self;

}
@end