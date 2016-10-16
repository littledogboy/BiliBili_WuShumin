//
//  Bungumi_UnfinishedCell.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/15.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BungumiSerializing;

@interface Bungumi_UnfinishedCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *coverImageView;
@property (strong, nonatomic) IBOutlet UILabel *lookCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *updateCountLabel;

// model
@property (nonatomic, strong) BungumiSerializing *serializing;
@end
