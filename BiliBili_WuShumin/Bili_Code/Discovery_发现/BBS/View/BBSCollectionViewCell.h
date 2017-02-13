//
//  BBSCollectionViewCell.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 17/2/8.
//  Copyright © 2017年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBSCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *tagImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, assign) BOOL isHiddenLine; // 是否隐藏线条
@property (nonatomic, assign) BOOL isShowCornerRadius; // 是否显示圆角

@end
