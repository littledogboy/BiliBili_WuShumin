//
//  FindHotwordModel.m
//  AGTagListView
//
//  Created by 吴书敏 on 17/2/5.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import "FindHotwordModel.h"

@interface FindHotwordModel ()
{
    NSString *_urlString;
}

@property (nonatomic, strong) FindHotwordEntity *hotwordEntity;
@property (nonatomic, strong) NSURLSessionDataTask *dataTask;

@end

@implementation FindHotwordModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _urlString = @"http://s.search.bilibili.com/main/hotword?access_key=1c2a81036b4b91243c303aa33d2d5b48&actionKey=appkey&appkey=27eb53fc9058f8c3&build=4000&device=phone&mobi_app=iphone&platform=ios&sign=2381d2eb628321e623d7d329097d30e5&ts=1482413798";
    }
    return self;
}

- (void)getHotWordEntityWithSuccess:(void (^)(void))success failure:(void (^)(NSString *))failure {
    [_dataTask cancel]; // 取消上一次网络请求
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    self.dataTask = [session dataTaskWithURL:[NSURL URLWithString:_urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        if (rootDic) {
            self.hotwordEntity = [[FindHotwordEntity alloc] initWithDictionary:rootDic];
            self.listArray = _hotwordEntity.list;
        }
        if (error) {
            failure(@"网络出错");
        } else {
            success();
        }
    }];
    [_dataTask resume];
}

@end
