//
//  Bungumi_PreviousCell.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/16.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "Bungumi_UnfinishedCell.h"
@class BungumiList;

@interface Bungumi_PreviousCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *coverImageView;
@property (strong, nonatomic) IBOutlet UILabel *lookCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

// model
@property (nonatomic, strong) BungumiList *list;


+ (CGSize )sizeOfBungumi_PreviousCell;


@end
