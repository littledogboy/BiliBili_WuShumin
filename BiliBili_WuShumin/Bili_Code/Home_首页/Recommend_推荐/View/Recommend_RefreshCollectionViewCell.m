//
//  Recommend_RefreshCollectionViewCell.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/9/1.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "Recommend_RefreshCollectionViewCell.h"
#import "Body.h"
#import "UIImageView+WebCache.h"
#import "NSString+AGAdd.h"
#import "AGHTTPURLHandle.h"
#import "AFNetworking.h"


@interface Recommend_RefreshCollectionViewCell ()



@property (nonatomic, strong) id receiveObject;

@end

@implementation Recommend_RefreshCollectionViewCell

- (void)dealloc {
    self.refreshBlock = nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return self;
    
    self.refreshCount = -1; // 初始为-1
    self.receiveObject = nil;
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.coverImageView.layer.borderWidth = 0.5f;
    self.coverImageView.layer.borderColor = [UIColor grayColor].CGColor;
    self.coverImageView.layer.cornerRadius = 5.0f;
    self.coverImageView.layer.masksToBounds =  YES;
    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping; // 以单词切割
    self.midView.backgroundColor = [UIColor clearColor];
    // 设置渐变层
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_history_item_graual_hd"]];
    bgImageView.frame = _midView.bounds;
    [self.midView insertSubview:bgImageView atIndex:0];
    //
    self.refreshCount = -1; // 初始为-1
    self.receiveObject = nil;

}

- (void)setBody:(Body *)body {
    if (body != nil) {
        _body = body;
        // 替换网络图片
        WS(ws);
        [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:body.cover]
                               placeholderImage:[UIImage imageNamed:@"cell_Default"]
                                      completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                          ws.coverImageView.contentMode = UIViewContentModeScaleAspectFit;
                                      }];
        self.titleLabel.text = body.title;
        self.playCountLabel.text = [NSString stringOfCount:body.play];
        self.danmukuCountLabel.text = [NSString stringOfCount:body.danmaku];
    }
}

// refreshAction
- (IBAction)refreshAction:(id)sender {
    // 点击次数增加
    self.refreshCount++;
    // 旋转动画
    CABasicAnimation *ratation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    ratation.delegate = self;
    [ratation setToValue:[NSNumber numberWithFloat:M_PI * 2]];
    [ratation setDuration:0.6f];
    ratation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]; // 设置timeFunction
    [_refreshBtn.layer addAnimation:ratation forKey:@"refreshAnimation"];
    
    // 推荐规则
    if (_section == 0) {
        [self request];
    }
    
    // 直播规则
    if (_section == 1) {
        NSInteger rand = self.refreshCount % 6;
        self.refreshURLString = [NSString stringWithFormat:@"http://app.bilibili.com/x/show/live?access_key=ccb14baf8320c1c2635011cceffa2b0c&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3470&channel=appstore&device=phone&mobi_app=iphone&plat=1&platform=ios&rand=%ld&sign=dff16ce917e98490d899c9d21d2cbc8a&ts=1472736052", rand];
        [self request];
    }
    
    // 分区规则
    if (_section > 1) {
        if (_refreshCount % 5 == 0) { // 进行网络请求
            [self request];
        } else { // 返回上一次请求数据
            self.refreshBlock(self.receiveObject, self.refreshCount);
        }
    }
    
}

- (void)request {
    WS(ws);
    [AGHTTPURLHandle GET:_refreshURLString success:^(NSURLSessionDataTask *task, id responseObject) {
        if (ws.refreshBlock != nil) {
            ws.receiveObject = responseObject;
            ws.refreshBlock(responseObject, _refreshCount);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
}

// 动画开始时
- (void)animationDidStart:(CAAnimation *)anim {
    self.isAnimation = YES;
}

// 动画结束时
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    // flag 表明是自然结束，还是被打断，比如调用了removeAnimationForKey:方法或removeAnimationForKey方法，flag为NO，如果是正常结束，flag为YES。
    self.isAnimation = NO;
}



@end
