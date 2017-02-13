//
//  HotWordViewController.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 17/2/7.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotWordViewController : UIViewController

@property (nonatomic, copy) void(^didSelectedCellBlock)(NSString *cellTitle);

@end
