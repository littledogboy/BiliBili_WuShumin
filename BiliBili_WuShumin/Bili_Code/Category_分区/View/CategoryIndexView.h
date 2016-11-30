//
//  CategoryIndexView.h
//  BiliBili_WuShumin
//
//  Created by 吴书敏 on 16/11/2.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryIndexView : UICollectionView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *categoryArray;

@end
