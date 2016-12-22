//
//  FindSearchPromtsModel.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/22.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FindSearchPromtsModel : NSObject

@property (nonatomic, strong, readonly) NSMutableArray<NSString *> *promptsWordArray;

@property (nonatomic, strong, readonly) NSMutableArray<NSString *> *historyWordArray;

- (void)getPromptsWordArrayWithKeyword:(NSString *)keyword success:(void (^)(void))success failure:(void (^)(NSString *errorMsg))failure;

- (void)removeAllHistoryWord;

@end
