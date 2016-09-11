//
//	Vip.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Vip.h"

@interface Vip ()
@end
@implementation Vip




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"accessStatus"] isKindOfClass:[NSNull class]]){
		self.accessStatus = [dictionary[@"accessStatus"] integerValue];
	}

	if(![dictionary[@"dueRemark"] isKindOfClass:[NSNull class]]){
		self.dueRemark = dictionary[@"dueRemark"];
	}	
	if(![dictionary[@"vipDueDate"] isKindOfClass:[NSNull class]]){
		self.vipDueDate = [dictionary[@"vipDueDate"] integerValue];
	}

	if(![dictionary[@"vipStatus"] isKindOfClass:[NSNull class]]){
		self.vipStatus = [dictionary[@"vipStatus"] integerValue];
	}

	if(![dictionary[@"vipStatusWarn"] isKindOfClass:[NSNull class]]){
		self.vipStatusWarn = dictionary[@"vipStatusWarn"];
	}	
	if(![dictionary[@"vipType"] isKindOfClass:[NSNull class]]){
		self.vipType = [dictionary[@"vipType"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"accessStatus"] = @(self.accessStatus);
	if(self.dueRemark != nil){
		dictionary[@"dueRemark"] = self.dueRemark;
	}
	dictionary[@"vipDueDate"] = @(self.vipDueDate);
	dictionary[@"vipStatus"] = @(self.vipStatus);
	if(self.vipStatusWarn != nil){
		dictionary[@"vipStatusWarn"] = self.vipStatusWarn;
	}
	dictionary[@"vipType"] = @(self.vipType);
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
	[aCoder encodeObject:@(self.accessStatus) forKey:@"accessStatus"];	if(self.dueRemark != nil){
		[aCoder encodeObject:self.dueRemark forKey:@"dueRemark"];
	}
	[aCoder encodeObject:@(self.vipDueDate) forKey:@"vipDueDate"];	[aCoder encodeObject:@(self.vipStatus) forKey:@"vipStatus"];	if(self.vipStatusWarn != nil){
		[aCoder encodeObject:self.vipStatusWarn forKey:@"vipStatusWarn"];
	}
	[aCoder encodeObject:@(self.vipType) forKey:@"vipType"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.accessStatus = [[aDecoder decodeObjectForKey:@"accessStatus"] integerValue];
	self.dueRemark = [aDecoder decodeObjectForKey:@"dueRemark"];
	self.vipDueDate = [[aDecoder decodeObjectForKey:@"vipDueDate"] integerValue];
	self.vipStatus = [[aDecoder decodeObjectForKey:@"vipStatus"] integerValue];
	self.vipStatusWarn = [aDecoder decodeObjectForKey:@"vipStatusWarn"];
	self.vipType = [[aDecoder decodeObjectForKey:@"vipType"] integerValue];
	return self;

}
@end