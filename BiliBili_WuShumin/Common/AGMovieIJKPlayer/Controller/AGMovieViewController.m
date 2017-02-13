//
//  AGMovieViewController.m
//  AGMovieIJKPlayer
//
//  Created by 吴书敏 on 16/9/19.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "AGMovieViewController.h"
#import "VideoXML.h"
#import <CommonCrypto/CommonCrypto.h>
#import "UIViewController+AGGetViewController.h"
#import "AppDelegate.h"

@interface AGMovieViewController () <NSXMLParserDelegate>

@property (nonatomic, strong) NSXMLParser    *xmlParser;
@property (nonatomic, copy  ) NSString       *currentElement;
@property (nonatomic, strong) VideoXML       *video;
@property (nonatomic, copy  ) NSMutableArray *movieURLArray;

@end

@implementation AGMovieViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    NSLog(@"%ld", CFGetRetainCount((__bridge CFTypeRef)(self.agMovieView)));
    // Do any additional setup after loading the view from its nib.
}


#pragma mark- aid set方法
- (void)setAid:(NSString *)aid {
    if (_aid != aid) {
        _aid = aid;
        [self getCIDByAID:aid];
    }
}

#pragma mark- 获取 cid cidStirng video

// 根据 aid 获取 cid cidString
// 新视频无法获取h5信息， 根据aid 求出cid
- (void)getCIDByAID:(NSString *)aid {
    NSString *h5String = [NSString stringWithFormat:@"http://www.bilibili.com/m/html5?aid=%@&page=1", aid];
    NSURL *h5URL = [NSURL URLWithString:h5String];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:h5URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        self.cidString = dic[@"cid"];
        self.h5URLString = dic[@"src"];
        NSArray *subStrings = [_cidString componentsSeparatedByString:@"/"];
        NSString *lastStirng = [subStrings lastObject];
        self.cid = [lastStirng substringToIndex:lastStirng.length - 4];
        if (_cid.length) {
            [self getVideoByCID:_cid];
        } else {
            NSLog(@"获取cid出错，采用bilibilijj获取视频源");
            //
//            NSString *urlString = [NSString stringWithFormat:@"http://www.bilibilijj.com/Files/DownLoad/%ld.mp4/www.bilibilijj.com.mp4?mp3=true", self.jjCid];
            NSString *urlString = @"http://cn-gdgz3-cmcc-v-08.acgvideo.com/vg6/0/80/1482982-1.mp4?expires=1486750200&ssig=HOZ1veVnSuQyHu4YcB7XeA&oi=2027306844&nfa=BaDS8BUFZDb8iKo4Vfwarw==&dynamic=1";
            
            NSMutableArray *array = [NSMutableArray arrayWithObject:[NSURL URLWithString:urlString]];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.agMovieView.movieURLArray = array;
            });
            
        }
    }];
    [dataTask resume];
}

// 根据 cid ，进行 xml解析
- (void)getVideoByCID:(NSString *)cid; {
    NSString *appkey = @"85eb6835b0a1034e";
    NSString *secretkey = @"2ad42749773c441109bdc0191257a664";
    NSString *sign_this = [NSString stringWithFormat:@"appkey=%@&cid=%@%@", appkey, cid, secretkey];
    NSString *lowerHash = [self md5LowerHashWithString:sign_this];
    NSString *videoURLString = [NSString stringWithFormat:@"http://interface.bilibili.com/playurl?appkey=%@&cid=%@&sign=%@", appkey, cid, lowerHash];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:videoURLString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 开始 xml 解析
        self.xmlParser = [[NSXMLParser alloc] initWithData:data];
        self.xmlParser.delegate = self;
        [self.xmlParser parse];
    }];
    [dataTask resume];
}

// md5加密
- (NSString *)md5LowerHashWithString:(NSString *)string {
    const char *cString = [string UTF8String]; // 转化为c字符串
    unsigned char result[CC_MD5_DIGEST_LENGTH]; // 16位 64位
    CC_MD5(cString, (CC_LONG)strlen(cString), result); // 存储在result中
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0;  i < CC_MD5_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02X", result[i]]; // 拼接二进制数据
    }
    NSString *lowerHash = [hash lowercaseString];
    return lowerHash;
}

#pragma mark- NSXMLParserDelegate
// 1. 文档开始
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"开始解析文档");
}

// 2. 元素开始
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    self.currentElement = elementName;
    if ([self.currentElement isEqualToString:@"video"]) { // 如果当前节点为 video 则开始创建
        self.video = [[VideoXML alloc] init];
    }
}

// 3. 获取元素数据
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    [_video setValue:string forKey:_currentElement];
}

// 4. 元素结束
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    //
    self.currentElement = nil;
}

// 5. 文档结束
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    // 给 movieURLArray 赋值
    if (self.video.durl.urls.count) {
        self.movieURLArray = [self.video.durl.urls copy];
        // 给agPlayerView赋值,播放视频
        dispatch_async(dispatch_get_main_queue(), ^{
            self.agMovieView.movieURLArray = self.movieURLArray;
        });
    } else { // - - appKey 无效。用 h5视频源代替
        NSMutableArray *array = [NSMutableArray arrayWithObject:[NSURL URLWithString:self.h5URLString]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.agMovieView.movieURLArray = array;
        });
    }
}


#pragma mark- 响应者链
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    if (self.traitCollection.verticalSizeClass != UIUserInterfaceSizeClassCompact) {
        self.view.frame = CGRectMake(0, 0, screenWidth, screenWidth * 14 / 25);
        ((UITabBarController *)[UIViewController rootViewController]).tabBar.hidden = NO;
    } else {
        self.view.frame = [UIScreen mainScreen].bounds;
        ((UITabBarController *)[UIViewController rootViewController]).tabBar.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- viewDidApp
- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.agMovieView shutDown];
    [_agMovieView removeFromSuperview];
}




#pragma mark- bilibilijj 获取视频源
// http://www.bilibilijj.com/Files/DownLoad/%ld.mp4/www.bilibilijj.com.mp4?mp3=true  cid


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
