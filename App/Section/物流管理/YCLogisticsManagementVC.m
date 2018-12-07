//
//  YCLogisticsManagementVC.m
//  juhao
//
//  Created by muzico on 2018/12/7.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCLogisticsManagementVC.h"

#import "YCAddressManagementBottomView.h"
#import "YCAddLogisticsVC.h"
#import "YCEditLogisticsVC.h"

#import "YCAddressManagementCollectionCell.h"

@interface YCLogisticsManagementVC ()<YCAddressManagementCollectionCellDelegate>

@end

@implementation YCLogisticsManagementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WeakSelf
    
    self.view.lqs_backgroundColor = @"#ededed";
    
    YCAddressManagementBottomView *bottomView = [YCAddressManagementBottomView lqs_viewWithXIB];
    [bottomView.button lqs_addTarget:self action:@selector(pressedButtonToAddAddress)];
    bottomView.button.lqs_title = @"自定义物流";
    
    CommonCollectionView *collectionView = [CommonCollectionView new];
    collectionView.column = 1;
    collectionView.cellHeight = 110;
    collectionView.cellNibString = @"YCAddressManagementCollectionCell";
    collectionView.setupCellBlock = ^(CommonCollectionView *collectionView, YCAddressManagementCollectionCell *cell, id dataSource, NSIndexPath *indexPath, NSInteger index) {
        
        if ([cell isKindOfClass:[YCAddressManagementCollectionCell class]]) {
            cell.delegate = weakSelf;
        }
    };
    [self lqs_boxControllerWithFillView:collectionView];
    
    
    collectionView.collectionDataSource = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    
    
    LQSBoxView *boxView = [LQSBoxView new];
    [boxView loadBodyView:collectionView];
    [boxView loadFootView:bottomView];
    boxView.footViewHeight = 60;
    [self lqs_boxControllerWithFillView:boxView];
}

- (void) pressedButtonToAddAddress {
    YCAddLogisticsVC *vc = [YCAddLogisticsVC new];
    CurrentViewControllerBackAndTitle(vc, self, @"新增物流")
}

#pragma mark - YCAddressManagementCollectionCellDelegate
- (void) ycAddressManagementCollectionCell:(YCAddressManagementCollectionCell *)cell defaultActionAtIndex:(NSInteger)index {
    
}
- (void) ycAddressManagementCollectionCell:(YCAddressManagementCollectionCell *)cell editActionAtIndex:(NSInteger)index {
    YCEditLogisticsVC *vc = [YCEditLogisticsVC new];
    CurrentViewControllerBackAndTitle(vc, self, @"编辑物流")
}
- (void) ycAddressManagementCollectionCell:(YCAddressManagementCollectionCell *)cell deleteActionAtIndex:(NSInteger)index {
    
}
@end
