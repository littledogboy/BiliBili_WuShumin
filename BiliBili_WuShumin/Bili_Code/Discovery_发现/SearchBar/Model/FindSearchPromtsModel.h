//
//  FindSearchPromtsModel.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/12/22.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FindSearchPromtsModel : NSObject

@property (nonatomic, strong, readonly) NSMutableArray<NSString *> *promptsWordArray; // 提示

@property (nonatomic, strong, readonly) NSMutableArray<NSString *> *historyWordArray; // 历史

- (void)getPromptsWordArrayWithKeyword:(NSString *)keyword success:(void (^)(void))success failure:(void (^)(NSString *errorMsg))failure;

- (void)removeAllHistoryWord;

@end
