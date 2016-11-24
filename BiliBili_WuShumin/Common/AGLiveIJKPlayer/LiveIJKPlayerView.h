//
//  LiveIJKPlayerView.h
//  AGLiveIJKPlayer
//
//  Created by 吴书敏 on 16/11/10.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IJKMediaFramework/IJKMediaFramework.h>

@protocol LiveIJKPlayerViewDelegate <NSObject>

- (void)liveViewRatation;

@end

@interface LiveIJKPlayerView : UIView

@property (nonatomic, copy) NSString *liveURLString;
@property (nonatomic, strong) IJKFFMoviePlayerController<IJKMediaPlayback> *ijkPlayer;

@property (nonatomic, assign) id<LiveIJKPlayerViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame liveURLString:(NSString *)urlString;

- (void)play; // 播放
- (void)pause; // 暂停
- (void)shutDown; // 终止

@end
