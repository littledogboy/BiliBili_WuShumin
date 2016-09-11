//
//	Eleclist.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Eleclist.h"

@interface Eleclist ()
@end
@implementation Eleclist




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"avatar"] isKindOfClass:[NSNull class]]){
		self.avatar = dictionary[@"avatar"];
	}	
	if(![dictionary[@"message"] isKindOfClass:[NSNull class]]){
		self.message = dictionary[@"message"];
	}	
	if(![dictionary[@"mid"] isKindOfClass:[NSNull class]]){
		self.mid = [dictionary[@"mid"] integerValue];
	}

	if(![dictionary[@"msg_deleted"] isKindOfClass:[NSNull class]]){
		self.msgDeleted = [dictionary[@"msg_deleted"] integerValue];
	}

	if(![dictionary[@"pay_mid"] isKindOfClass:[NSNull class]]){
		self.payMid = [dictionary[@"pay_mid"] integerValue];
	}

	if(![dictionary[@"rank"] isKindOfClass:[NSNull class]]){
		self.rank = [dictionary[@"rank"] integerValue];
	}

	if(![dictionary[@"uname"] isKindOfClass:[NSNull class]]){
		self.uname = dictionary[@"uname"];
	}	
	if(![dictionary[@"vip_info"] isKindOfClass:[NSNull class]]){
		self.vipInfo = [[VipInfo alloc] initWithDictionary:dictionary[@"vip_info"]];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.avatar != nil){
		dictionary[@"avatar"] = self.avatar;
	}
	if(self.message != nil){
		dictionary[@"message"] = self.message;
	}
	dictionary[@"mid"] = @(self.mid);
	dictionary[@"msg_deleted"] = @(self.msgDeleted);
	dictionary[@"pay_mid"] = @(self.payMid);
	dictionary[@"rank"] = @(self.rank);
	if(self.uname != nil){
		dictionary[@"uname"] = self.uname;
	}
	if(self.vipInfo != nil){
		dictionary[@"vip_info"] = [self.vipInfo toDictionary];
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
	if(self.avatar != nil){
		[aCoder encodeObject:self.avatar forKey:@"avatar"];
	}
	if(self.message != nil){
		[aCoder encodeObject:self.message forKey:@"message"];
	}
	[aCoder encodeObject:@(self.mid) forKey:@"mid"];	[aCoder encodeObject:@(self.msgDeleted) forKey:@"msg_deleted"];	[aCoder encodeObject:@(self.payMid) forKey:@"pay_mid"];	[aCoder encodeObject:@(self.rank) forKey:@"rank"];	if(self.uname != nil){
		[aCoder encodeObject:self.uname forKey:@"uname"];
	}
	if(self.vipInfo != nil){
		[aCoder encodeObject:self.vipInfo forKey:@"vip_info"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.avatar = [aDecoder decodeObjectForKey:@"avatar"];
	self.message = [aDecoder decodeObjectForKey:@"message"];
	self.mid = [[aDecoder decodeObjectForKey:@"mid"] integerValue];
	self.msgDeleted = [[aDecoder decodeObjectForKey:@"msg_deleted"] integerValue];
	self.payMid = [[aDecoder decodeObjectForKey:@"pay_mid"] integerValue];
	self.rank = [[aDecoder decodeObjectForKey:@"rank"] integerValue];
	self.uname = [aDecoder decodeObjectForKey:@"uname"];
	self.vipInfo = [aDecoder decodeObjectForKey:@"vip_info"];
	return self;

}
@end