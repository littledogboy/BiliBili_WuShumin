//
//  Recommend_RefreshCollectionViewCell.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/9/1.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Body;

typedef void (^RefreshBlock)(id reponseObject, NSInteger refreshCount);

@interface Recommend_RefreshCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *coverImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIView *midView;
@property (strong, nonatomic) IBOutlet UILabel *playCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *danmukuCountLabel;
@property (strong, nonatomic) IBOutlet UIButton *refreshBtn;

@property (nonatomic, copy) NSString *refreshURLString;
@property (nonatomic, copy) RefreshBlock refreshBlock;
@property (nonatomic, assign) NSInteger section;
// 当前点击次数
@property (nonatomic, assign) NSInteger refreshCount;

@property (nonatomic, assign) BOOL isAnimation;

@property (nonatomic, strong) Body *body;

@end
