//
//  YCDiscoverDesignerVC.m
//  juhao
//
//  Created by muzico on 2018/12/1.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCDiscoverDesignerVC.h"

@interface YCDiscoverDesignerVC ()

@end

@implementation YCDiscoverDesignerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    
    CommonCollectionView *collectionView = [CommonCollectionView new];
    collectionView.column = 1;
    collectionView.cellHeight = 180;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"qqqqqqq"];
    collectionView.setupCellBlock = ^(CommonCollectionView *collectionView, UICollectionViewCell *cell, id dataSource, NSIndexPath *indexPath, NSInteger index) {
        cell.lqs_backgroundColor = @"R";
    };
    [self lqs_boxControllerWithFillView:collectionView];
    
    
    collectionView.collectionDataSource = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
}


@end
