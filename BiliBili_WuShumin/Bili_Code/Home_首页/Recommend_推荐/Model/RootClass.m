//
//	RootClass.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "RootClass.h"

@interface RootClass ()
@end
@implementation RootClass




/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"code"] = @(self.code);
	if(self.list != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(List * listElement in self.list){
			[dictionaryElements addObject:[listElement toDictionary]];
		}
		dictionary[@"list"] = dictionaryElements;
	}
	dictionary[@"pages"] = @(self.pages);
	dictionary[@"results"] = @(self.results);
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
	[aCoder encodeObject:@(self.code) forKey:@"code"];	if(self.list != nil){
		[aCoder encodeObject:self.list forKey:@"list"];
	}
	[aCoder encodeObject:@(self.pages) forKey:@"pages"];	[aCoder encodeObject:@(self.results) forKey:@"results"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [[aDecoder decodeObjectForKey:@"code"] integerValue];
	self.list = [aDecoder decodeObjectForKey:@"list"];
	self.pages = [[aDecoder decodeObjectForKey:@"pages"] integerValue];
	self.results = [[aDecoder decodeObjectForKey:@"results"] integerValue];
	return self;

}
@end