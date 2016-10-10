//
//  URLRouterConfig.m
//  URLRooter
//
//  Created by 吴书敏 on 16/10/9.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "URLRouter.h"
#import "UIViewController+AGGetViewController.h"
#import "HotPromoteDetailViewController.h"

/**
 *  gcc为函数提供了几种类型的属性，其中包含：构造函数(constructors)和析构函数(destructors)。
 *  带有"构造函数"属性的函数将在main()函数之前被执行，而声明为"析构函数"属性的函数则将在main()退出时执行。
 *  构造函数 中 注册
 */
__attribute__((constructor))
static void URLRouterConfig(void)
{
    // URLRouter registerClass
    // bilibili://video/
    [URLRouter registerKey:@"video" canOpenURL:^BOOL(NSString *URL) {
        return [URL hasPrefix:@"bilibili://video/"];
    } toHandler:^BOOL(URLRouterParameters *routerParameters) {
        NSString *aid = [routerParameters.URL lastPathComponent];
        HotPromoteDetailViewController *hotPromoteDVC = [[HotPromoteDetailViewController alloc] init];
        hotPromoteDVC.aid = aid;
        [[UIViewController currentNavigationViewController] pushViewController:hotPromoteDVC animated:YES];
        return YES;
    }];
}
