//
//	Right.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Right.h"

@interface Right ()
@end
@implementation Right




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"bp"] isKindOfClass:[NSNull class]]){
		self.bp = [dictionary[@"bp"] integerValue];
	}

	if(![dictionary[@"download"] isKindOfClass:[NSNull class]]){
		self.download = [dictionary[@"download"] integerValue];
	}

	if(![dictionary[@"elec"] isKindOfClass:[NSNull class]]){
		self.elec = [dictionary[@"elec"] integerValue];
	}

	if(![dictionary[@"movie"] isKindOfClass:[NSNull class]]){
		self.movie = [dictionary[@"movie"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"bp"] = @(self.bp);
	dictionary[@"download"] = @(self.download);
	dictionary[@"elec"] = @(self.elec);
	dictionary[@"movie"] = @(self.movie);
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
	[aCoder encodeObject:@(self.bp) forKey:@"bp"];	[aCoder encodeObject:@(self.download) forKey:@"download"];	[aCoder encodeObject:@(self.elec) forKey:@"elec"];	[aCoder encodeObject:@(self.movie) forKey:@"movie"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.bp = [[aDecoder decodeObjectForKey:@"bp"] integerValue];
	self.download = [[aDecoder decodeObjectForKey:@"download"] integerValue];
	self.elec = [[aDecoder decodeObjectForKey:@"elec"] integerValue];
	self.movie = [[aDecoder decodeObjectForKey:@"movie"] integerValue];
	return self;

}
@end