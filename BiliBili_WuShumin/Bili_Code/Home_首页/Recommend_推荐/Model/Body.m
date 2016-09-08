//
//	Body.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Body.h"


@interface Body ()
@end
@implementation Body




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"cover"] isKindOfClass:[NSNull class]]){
		self.cover = dictionary[@"cover"];
	}	
	if(![dictionary[@"danmaku"] isKindOfClass:[NSNull class]]){
		self.danmaku = [dictionary[@"danmaku"] integerValue];
	}

	if(![dictionary[@"goto"] isKindOfClass:[NSNull class]]){
		self.gotoField = dictionary[@"goto"];
	}	
	if(![dictionary[@"param"] isKindOfClass:[NSNull class]]){
		self.param = dictionary[@"param"];
	}	
	if(![dictionary[@"play"] isKindOfClass:[NSNull class]]){
		self.play = [dictionary[@"play"] integerValue];
	}

	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	if(![dictionary[@"uri"] isKindOfClass:[NSNull class]]){
		self.uri = dictionary[@"uri"];
	}
    
    // live
    if(![dictionary[@"area"] isKindOfClass:[NSNull class]]){
        self.area = dictionary[@"area"];
    }
    if(![dictionary[@"area_id"] isKindOfClass:[NSNull class]]){
        self.areaId = [dictionary[@"area_id"] integerValue];
    }
    if(![dictionary[@"face"] isKindOfClass:[NSNull class]]){
        self.face = dictionary[@"face"];
    }
    if(![dictionary[@"name"] isKindOfClass:[NSNull class]]){
        self.name = dictionary[@"name"];
    }
    if(![dictionary[@"online"] isKindOfClass:[NSNull class]]){
        self.online = [dictionary[@"online"] integerValue];
    }
    
    // bangumi
    if(![dictionary[@"mtime"] isKindOfClass:[NSNull class]]){
        self.mtime = dictionary[@"mtime"];
    }
    
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.cover != nil){
		dictionary[@"cover"] = self.cover;
	}
	dictionary[@"danmaku"] = @(self.danmaku);
	if(self.gotoField != nil){
		dictionary[@"goto"] = self.gotoField;
	}
	if(self.param != nil){
		dictionary[@"param"] = self.param;
	}
	dictionary[@"play"] = @(self.play);
	if(self.title != nil){
		dictionary[@"title"] = self.title;
	}
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
	if(self.cover != nil){
		[aCoder encodeObject:self.cover forKey:@"cover"];
	}
	[aCoder encodeObject:@(self.danmaku) forKey:@"danmaku"];	if(self.gotoField != nil){
		[aCoder encodeObject:self.gotoField forKey:@"goto"];
	}
	if(self.param != nil){
		[aCoder encodeObject:self.param forKey:@"param"];
	}
	[aCoder encodeObject:@(self.play) forKey:@"play"];	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}
	if(self.uri != nil){
		[aCoder encodeObject:self.uri forKey:@"uri"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.cover = [aDecoder decodeObjectForKey:@"cover"];
	self.danmaku = [[aDecoder decodeObjectForKey:@"danmaku"] integerValue];
	self.gotoField = [aDecoder decodeObjectForKey:@"goto"];
	self.param = [aDecoder decodeObjectForKey:@"param"];
	self.play = [[aDecoder decodeObjectForKey:@"play"] integerValue];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	self.uri = [aDecoder decodeObjectForKey:@"uri"];
	return self;

}

#pragma mark- setLive

- (void)setLiveModel:(Live *)liveModel {
    if (liveModel != nil) {
        _liveModel = liveModel;
        
        self.cover = liveModel.cover;
        self.face = liveModel.face;
        self.online = liveModel.online;
        self.title = liveModel.title;
        self.name = liveModel.name;
    }
}

#pragma mark- setList

- (void)setListModel:(List *)listModel {
    if (listModel != nil) {
        _listModel = listModel;
        self.cover = listModel.pic;
        self.play = listModel.play;
        self.danmaku = listModel.videoReview;
        self.title = listModel.title;
    }
}


@end