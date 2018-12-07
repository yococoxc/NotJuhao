//
//  YCCartHomeVC.m
//  juhao
//
//  Created by muzico on 2018/11/29.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCCartHomeVC.h"

#import "YCCartHomeBottomView.h"
#import "YCCartHomeMiddleView.h"
#import "YCCartHomeCollectionCell.h"

@interface YCCartHomeVC ()

@end

@implementation YCCartHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.lqs_backgroundColor = @"#ededed";
    
    NSMutableArray *keepArray = [NSMutableArray array];
    {
        YCCartHomeBottomView *bottomView = [YCCartHomeBottomView lqs_viewWithXIB];
        
        CommonFixViewItem *item = [CommonFixViewItem new];
        item.height = 50;
        item.view = bottomView;
        [keepArray addObject:item];
    }
    {
        YCCartHomeMiddleView *middleView = [YCCartHomeMiddleView lqs_viewWithXIB];
        
        CommonFixViewItem *item = [CommonFixViewItem new];
        item.height = 40;
        item.view = middleView;
        [keepArray addObject:item];
    }
    
    
    
    
    CommonCollectionView *collectionView = [CommonCollectionView new];
    collectionView.column = 1;
    collectionView.cellHeight = 120;
    collectionView.cellNibString = @"YCCartHomeCollectionCell";
    collectionView.setupCellBlock = ^(CommonCollectionView *collectionView, UICollectionViewCell *cell, id dataSource, NSIndexPath *indexPath, NSInteger index) {
        
    };
    collectionView.collectionDataSource = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    
    
    CommonFixView *fixView = [CommonFixView new];
    fixView.footItems = keepArray;
    fixView.otherView = collectionView;
    [self lqs_boxControllerWithFillView:fixView];
}

@end
