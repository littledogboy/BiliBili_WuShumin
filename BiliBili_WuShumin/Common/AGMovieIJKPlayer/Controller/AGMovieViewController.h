//
//  AGMovieViewController.h
//  AGMovieIJKPlayer
//
//  Created by 吴书敏 on 16/9/19.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGMovieView.h"

@interface AGMovieViewController : UIViewController

@property (nonatomic, copy  ) NSString    *aid;
@property (nonatomic, copy  ) NSString    *cid;
@property (nonatomic, assign) NSInteger   jjCid;
@property (nonatomic, copy  ) NSString    *cidString;
@property (nonatomic, copy  ) NSString    *h5URLString;
@property (weak, nonatomic) IBOutlet AGMovieView *agMovieView;


@end
