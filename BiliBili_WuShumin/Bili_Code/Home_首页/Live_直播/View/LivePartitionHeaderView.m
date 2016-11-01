//
//  LivePartitionHeaderView.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/27.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "LivePartitionHeaderView.h"
#import "LivePartition_Partition.h"
#import "UIImageView+WebCache.h"

@interface LivePartitionHeaderView ()

@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;

@property (strong, nonatomic) IBOutlet UILabel *title;

@property (strong, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation LivePartitionHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setPartition:(LivePartition_Partition *)partition {
    if (_partition != partition) {
        _partition = partition;
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:partition.subIcon.src]];
        self.title.text = partition.name;
        self.countLabel.text = [NSString stringWithFormat:@"%ld", partition.count];
    }
}

+ (CGSize )sizeOfPartitionHeaderView {
    return CGSizeMake(screenWidth, 20);
}



@end
