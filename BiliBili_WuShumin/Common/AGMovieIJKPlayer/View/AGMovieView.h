//
//  AGMovieView.h
//  AGMovieIJKPlayer
//
//  Created by 吴书敏 on 16/9/19.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IJKMediaFramework/IJKMediaFramework.h>


@interface AGMovieView : UIView

@property (nonatomic, copy) NSArray<NSURL *> *movieURLArray;

@property (nonatomic, strong) IJKFFMoviePlayerController<IJKMediaPlayback> *ijkPlayer;


@end
