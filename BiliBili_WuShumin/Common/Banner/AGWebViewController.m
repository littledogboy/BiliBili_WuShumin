//
//  AGWebViewController.m
//  AGCircularScrollView
//
//  Created by 吴书敏 on 16/2/29.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "AGWebViewController.h"
#import <WebKit/WebKit.h>
#import "BannerImage.h"

@interface AGWebViewController ()

@end

@implementation AGWebViewController

/*
/// ^代表以后面一个字符的开始  比如：^a : ab aab aaab
// $代表前面一个字符的结束

// * + ?  用于修饰前面的字符
// * 前面的字符 出现0次或者+无穷  0,正无穷；
// + 前面的字符 出现1次或者+无穷， 1，正无穷
// ? 前面的字符 出现0此或者1次，   0， 1

// {a, b} 表示前面字符出现的次数的范围
// * 相当于 {0, }  ，+ {1,} ? {0, 1}
// 注意：可以没有下限，但是不能没有上限！例如“ab{,5}”是错误的写法
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 判断是url链接还是 iosURL连接.http://acg.tv/u11R
    if ([self.bannerImage.value containsString:@"acg.tv"]) {
       // 如果是value 的名字中有acg.tv说明是AppStore的url链接，则进入到AppStore
        [self openURL];
        
    } else { // 否则进入相关网页
        
        // 1. 创建wkwebview
        WKWebView *webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        webView.scrollView.backgroundColor = [UIColor grayColor];
        // 2. 进行网络请求
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.bannerImage.value]]];
        // 3. 添加
        [self.view addSubview:webView];
    }

        // Do any additional setup after loading the view.
}


#pragma mark-
#pragma mark openURL进入AppStore
- (void)openURL
{
    __block NSString *desWebURL = nil;
    __block NSString *htmlString = nil;
    // 1. 创建一个串行队列
    dispatch_queue_t serialQ = dispatch_queue_create("q1", DISPATCH_QUEUE_SERIAL);
    
    // 2. 添加获取网页源码任务
    dispatch_async(serialQ, ^{
        // 同步的网络请求，放到子线程中
        htmlString = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:self.bannerImage.value] encoding:NSUTF8StringEncoding error:nil];
    });
    
    // 3. 添加正则匹配任务
    __weak typeof(self)WeakSelf = self;
    dispatch_async(serialQ, ^{
        desWebURL =  [WeakSelf regulaerExpression:@"href=\"(.)+\"" forMatchString:htmlString];
    });
    
    // 4. 进入对应页面
    dispatch_async(serialQ, ^{
        // 回到主线程，进入相关页面
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:desWebURL]];
        });
        
    });
}


#pragma mark-
#pragma mark 正则表达式处理
- (NSString *)regulaerExpression:(NSString *)expression forMatchString:(NSString *)matchString
{
    @autoreleasepool {
        
    NSString *desWebURL = nil;

    // 1. 匹配字符串
    NSString *searchText = matchString;
    // 2. error
    NSError *error = NULL;
    // 3. 表达式对象
    // 创建方式有两种。 1. 实例方法 和 类方法
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression options:NSRegularExpressionCaseInsensitive error:&error]; // 不区分大小写
    // 获取匹配结果
    NSTextCheckingResult *result = [regex firstMatchInString:searchText options:0 range:NSMakeRange(0, [searchText length])];
    // 如果匹配到则截取，替换
        if (result) {
            NSString *matchString = [searchText substringWithRange:result.range];
            desWebURL = [matchString substringWithRange:NSMakeRange(11, matchString.length - 12)];
            desWebURL = [NSString stringWithFormat:@"itms-apps%@", desWebURL];
            NSLog(@"%@", desWebURL);
        }
    
    return desWebURL;
        
    }
}


- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"%@ %d", self.navigationController.topViewController, __LINE__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
