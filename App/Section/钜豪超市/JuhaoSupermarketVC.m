//
//  JuhaoSupermarketVC.m
//  juhao
//
//  Created by muzico on 2018/12/1.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "JuhaoSupermarketVC.h"

#import "YCProjectDetailVC.h"
#import "YCNewProductCollectionCell.h"

@interface JuhaoSupermarketVC ()

@property(nonatomic,strong) CommonCollectionView *collectionView;

@end

@implementation JuhaoSupermarketVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.view.lqs_backgroundColor = @"#ededed";
    
    WeakSelf
    
    
    CommonCollectionView *collectionView = [CommonCollectionView new];
    collectionView.column = 2;
    collectionView.cellNibString = @"YCNewProductCollectionCell";
    collectionView.cellSizeScale = 1.3;
    collectionView.didSelectBlock = ^(CommonCollectionView *collectionView, id dataSource, NSIndexPath *indexPath, NSInteger index) {
        
        YCProjectDetailVC *vc = [YCProjectDetailVC new];
        CurrentViewController(vc, weakSelf)
    };
    
    [self lqs_boxControllerWithFillView:collectionView];
    self.collectionView = collectionView;
    
    
    collectionView.collectionDataSource = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
}

@end
