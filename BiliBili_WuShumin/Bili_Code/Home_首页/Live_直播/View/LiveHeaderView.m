//
//  LiveHeaderView.m
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/10/27.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "LiveHeaderView.h"
#import "AGCircularScrollView.h"
#import "BungumiCaterotyTouchView.h"
#import "LivePartition_Partition.h"

@interface LiveHeaderView ()

@property (strong, nonatomic) IBOutlet UIView *topView;
@property (nonatomic, strong) AGCircularScrollView *agCSV;

@property (strong, nonatomic) IBOutlet BungumiCaterotyTouchView *attentionArchorTouchView;
@property (strong, nonatomic) IBOutlet BungumiCaterotyTouchView *liveCenterTouchView;
@property (strong, nonatomic) IBOutlet BungumiCaterotyTouchView *searchRoomTouchView;
@property (strong, nonatomic) IBOutlet BungumiCaterotyTouchView *allCategoryTouchView;

@property (strong, nonatomic) IBOutlet UIView *downView;
@property (strong, nonatomic) IBOutlet UILabel *archorCountLabel;

@end

@implementation LiveHeaderView

- (AGCircularScrollView *)agCSV {
    if (_agCSV == nil) {
        _agCSV = [[AGCircularScrollView alloc] initWithFrame:_topView.bounds];
    }
    return _agCSV;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.topView addSubview:self.agCSV];
    
    // touchView 赋值
    self.attentionArchorTouchView.imageView.image = [UIImage imageNamed:@"live_home_follow_ico"];
    self.attentionArchorTouchView.titleLabel.text = @"关注主播";
    self.liveCenterTouchView.imageView.image = [UIImage imageNamed:@"live_home_center_ico"];
    self.liveCenterTouchView.titleLabel.text = @"直播中心";
    self.searchRoomTouchView.imageView.image = [UIImage imageNamed:@"live_home_search_ico"];
    self.searchRoomTouchView.titleLabel.text = @"搜索房间";
    self.allCategoryTouchView.imageView.image = [UIImage imageNamed:@"live_home_category_ico"];
    self.allCategoryTouchView.titleLabel.text = @"全部分类";
    
    //
    self.downView.backgroundColor = RecommendGrayColor;
}

- (void)setImageMapKey:(NSString *)imageMapKey {
    if (_imageMapKey != imageMapKey) {
        _imageMapKey = imageMapKey;
        [self.agCSV registerImageMapKey:imageMapKey];
    }
}

- (void)setCircleViewModelArray:(NSArray *)circleViewModelArray {
    if ( _circleViewModelArray != circleViewModelArray) {
        _circleViewModelArray = circleViewModelArray;
        self.agCSV.bannerImageModel = circleViewModelArray;
    }
}

- (void)setPartition:(LivePartition_Partition *)partition {
    if (_partition != partition) {
        _partition = partition;
        self.archorCountLabel.text = [NSString stringWithFormat:@"%ld", partition.count];
    }
}

+ (CGSize )sizeOfLiveHeaderView {
    return CGSizeMake(screenWidth, 223);
}



@end
