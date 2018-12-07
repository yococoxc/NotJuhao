//
//  YCFootprintVC.m
//  juhao
//
//  Created by muzico on 2018/12/7.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCFootprintVC.h"
#import "YCFootprintCollectionCell.h"
#import "YCProjectDetailVC.h"

@interface YCFootprintVC ()

@end

@implementation YCFootprintVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WeakSelf
    
    self.view.lqs_backgroundColor = @"#ededed";
    
    CommonCollectionView *collectionView = [CommonCollectionView new];
    collectionView.column = 1;
    collectionView.cellHeight = 110;
    collectionView.cellNibString = @"YCFootprintCollectionCell";
    collectionView.setupCellBlock = ^(CommonCollectionView *collectionView, YCFootprintCollectionCell *cell, id dataSource, NSIndexPath *indexPath, NSInteger index) {
        
    };
    collectionView.didSelectBlock = ^(CommonCollectionView *collectionView, id dataSource, NSIndexPath *indexPath, NSInteger index) {
        YCProjectDetailVC *vc = [YCProjectDetailVC new];
        CurrentViewController(vc, weakSelf)
    };
    [self lqs_boxControllerWithFillView:collectionView];
    
    collectionView.collectionDataSource = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
}

@end
