//
//  BannerImage.h
//  AGCircularScrollView
//
//  Created by 吴书敏 on 16/2/25.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

typedef enum URLType{
    weblink = 2,
    bangumi = 3
}URLType;

#import <Foundation/Foundation.h>



@interface BannerImage : NSObject

@property (nonatomic, copy) NSString *image; // 图片链接
@property (nonatomic, copy) NSString *remark; // 拓展数据
@property (nonatomic, copy) NSString *title; // 标题
@property (nonatomic, assign) URLType type; // 类型 2 为webUrl 3为app内链接
@property (nonatomic, copy) NSString *value; // id值
@property (nonatomic, assign) NSInteger *weight; // 权重

@end
