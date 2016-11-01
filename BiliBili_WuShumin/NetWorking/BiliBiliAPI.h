//
//  BiliBiliAPI.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/8/25.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#ifndef BiliBiliAPI_h
#define BiliBiliAPI_h

//首页
#pragma mark- 直播页面
// 直播页面
#define Home_LiveURLString @"http://live.bilibili.com/AppNewIndex/common?scale=2&device=phone&platform=ios"
// 直播推荐
#define Live_RecommendURLString @"http://live.bilibili.com/AppNewIndex/recommend?access_key=a97c86bad48e821156213b9728ba3cec&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3910&buvid=f6f22b968fe7729b6af9d7e3a8dd3359&device=phone&mobi_app=iphone&platform=ios&scale=2&sign=1792d55eab8630d25b69fecb27da49c8&ts=1476954237"


#pragma mark- - 推荐页面
// 推荐页面
#define Home_RecommendURLString @"http://app.bilibili.com/x/v2/show?access_key=ccb14baf8320c1c2635011cceffa2b0c&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3470&channel=appstore&device=phone&mobi_app=iphone&plat=1&platform=ios&sign=dc6f3842d84163f3ad71727fc75c3ba7&ts=1472185514&warm=1"
// 热门推荐
#define Recommend_RecommendURLString @"http://app.bilibili.com/x/v2/show/change?access_key=ccb14baf8320c1c2635011cceffa2b0c&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3470&channel=appstore&device=phone&mobi_app=iphone&plat=1&platform=ios&rand=1&sign=76d5c45c83a5c68ff2541efad661d843&ts=1472735353"
//  正在直播
#define Recommend_LiveURLString @"http://app.bilibili.com/x/show/live?access_key=ccb14baf8320c1c2635011cceffa2b0c&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3470&channel=appstore&device=phone&mobi_app=iphone&plat=1&platform=ios&rand=0&sign=dff16ce917e98490d899c9d21d2cbc8a&ts=1472736052"
// 动画区
#define Recommend_BangumiURLString @"http://api.bilibili.com/ding_index?access_key=ccb14baf8320c1c2635011cceffa2b0c&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3470&device=phone&mobi_app=iphone&pagesize=20&platform=ios&sign=8edc66406ebbe953630cce1688ba461f&tid=1&ts=1472736168"
// 音乐区
#define Recommend_MusicURLString @"http://www.bilibili.com/index/ding/3.json?access_key=ccb14baf8320c1c2635011cceffa2b0c&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3470&device=phone&mobi_app=iphone&pagesize=20&platform=ios&sign=8d5a5bfa69f040cbe55479247bba76f9&tid=3&ts=1472736398"
// 舞蹈区
#define Recommend_DanceURLString @"http://www.bilibili.com/index/ding/129.json?access_key=ccb14baf8320c1c2635011cceffa2b0c&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3470&device=phone&mobi_app=iphone&pagesize=20&platform=ios&sign=36103e7724661c533c2a013d2727e91c&tid=129&ts=1472737143"
// 游戏区
#define Recommend_GameURLString @"http://www.bilibili.com/index/ding/4.json?access_key=ccb14baf8320c1c2635011cceffa2b0c&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3470&device=phone&mobi_app=iphone&pagesize=20&platform=ios&sign=2176d07741faecb9cb375b203db321ad&tid=4&ts=1472737242"
// 鬼畜区
#define Recommend_GuiChuURLString @"http://www.bilibili.com/index/ding/119.json?access_key=ccb14baf8320c1c2635011cceffa2b0c&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3470&device=phone&mobi_app=iphone&pagesize=20&platform=ios&sign=c1c3aa019af598602c6d7f290c5c936d&tid=119&ts=1472737425"
// 科技区
#define Recommend_TechURLString @"http://www.bilibili.com/index/ding/36.json?access_key=ccb14baf8320c1c2635011cceffa2b0c&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3470&device=phone&mobi_app=iphone&pagesize=20&platform=ios&sign=fd65406cc150e02353d969c13c6cc272&tid=36&ts=1472737477"
// 生活区
#define Recommend_LifeURLString @"http://www.bilibili.com/index/ding/160.json?access_key=ccb14baf8320c1c2635011cceffa2b0c&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3470&device=phone&mobi_app=iphone&pagesize=20&platform=ios&sign=9a4c97d2189c130d09dc2925d8edf2d0&tid=160&ts=1472737537"
// 时尚区
#define Recommend_FashionURLString @"http://www.bilibili.com/index/ding/155.json?access_key=ccb14baf8320c1c2635011cceffa2b0c&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3470&device=phone&mobi_app=iphone&pagesize=20&platform=ios&sign=dc78a45e923b207a52ffa4d594229b56&tid=155&ts=1472737598"
// 娱乐区
#define Recommend_EntertainmentURLString @"http://www.bilibili.com/index/ding/5.json?access_key=ccb14baf8320c1c2635011cceffa2b0c&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3470&device=phone&mobi_app=iphone&pagesize=20&platform=ios&sign=a92136a929036cec8d6c894520fd351d&tid=5&ts=1472737733"
// 电视区
#define Recommend_TVURLString @"http://www.bilibili.com/index/ding/11.json?access_key=ccb14baf8320c1c2635011cceffa2b0c&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3470&device=phone&mobi_app=iphone&pagesize=20&platform=ios&sign=11f7cd2e1c8ec3b4199f92482e4b334b&tid=11&ts=1472737807"
// 电影区
#define Recommend_MovieString @"http://www.bilibili.com/index/ding/23.json?access_key=ccb14baf8320c1c2635011cceffa2b0c&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3470&device=phone&mobi_app=iphone&pagesize=20&platform=ios&sign=a52660ad00dde22a248e8e51e061c981&tid=23&ts=1473284725"

#pragma mark- 推荐详情

#pragma mark- 番剧
// 番剧首页
#define BungumiURLString @"http://bangumi.bilibili.com/api/app_index_page_v4?build=3910&device=phone&mobi_app=iphone&platform=ios"
// 番剧推荐
#define BungumiRecommendString @"http://bangumi.bilibili.com/api/bangumi_recommend?access_key=a97c86bad48e821156213b9728ba3cec&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3910&cursor=0&device=phone&mobi_app=iphone&pagesize=10&platform=ios&sign=a23ccdd20f2c2d9ae38bc52c5a5a3a5f&ts=1476273037"





#endif /* BiliBiliAPI_h */
