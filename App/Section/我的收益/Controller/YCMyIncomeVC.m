//
//  YCMyIncomeVC.m
//  juhao
//
//  Created by muzico on 2018/12/7.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCMyIncomeVC.h"

#import "YCMyIncomeView1.h"
#import "YCMyIncomeView2.h"
#import "YCMyIncomeView3.h"

#import "YCAddressManagementBottomView.h"

#import "YCWithdrawVC.h"
#import "YCWithdrawDetailVC.h"
#import "YCIncomeDetailVC.h"

@interface YCMyIncomeVC ()

@end

@implementation YCMyIncomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.lqs_backgroundColor = @"#ededed";
    
    NSMutableArray *keepArray = [NSMutableArray array];
#pragma mark - 当前可用余额
    {
        YCMyIncomeView1 *targetView = [YCMyIncomeView1 lqs_viewWithXIB];
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 130;
        item.insets = UIEdgeInsetsMake(0, 0, 8, 0);
        
        [keepArray addObject:item];
    }
#pragma mark - 销售情况
    {
        YCMyIncomeView2 *targetView = [YCMyIncomeView2 lqs_viewWithXIB];
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 77;
        item.insets = UIEdgeInsetsMake(0, 0, 8, 0);
        
        [keepArray addObject:item];
    }
#pragma mark - 收益明细
    {
        YCMyIncomeView3 *targetView = [YCMyIncomeView3 lqs_viewWithXIB];
        targetView.titleLabel.text = @"收益明细";
        [targetView lqs_addTarget:self action:@selector(pressedControlToIncomeDetail)];
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 40;
        item.insets = UIEdgeInsetsMake(0, 0, 8, 0);
        
        [keepArray addObject:item];
    }
#pragma mark - 提现明细
    {
        YCMyIncomeView3 *targetView = [YCMyIncomeView3 lqs_viewWithXIB];
        targetView.titleLabel.text = @"提现明细";
        [targetView lqs_addTarget:self action:@selector(pressedControlToWithdrawDetail)];
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 40;
        item.insets = UIEdgeInsetsMake(0, 0, 8, 0);
        
        [keepArray addObject:item];
    }
    
    
    CommonScrollView2 *scrollView = [CommonScrollView2 new];
    scrollView.items = keepArray;
    
    //底部按钮
    YCAddressManagementBottomView *bottomView = [YCAddressManagementBottomView lqs_viewWithXIB];
    bottomView.button.lqs_title = @"提现";
    [bottomView.button lqs_addTarget:self action:@selector(pressedButtonToWithdraw)];
    
    //容器
    LQSBoxView *boxView = [LQSBoxView new];
    [boxView loadBodyView:scrollView];
    [boxView loadFootView:bottomView];
    boxView.footViewHeight = 60;
    [self lqs_boxControllerWithFillView:boxView];
}


- (void) pressedButtonToWithdraw {
    YCWithdrawVC *vc = [YCWithdrawVC new];
    CurrentViewControllerBackAndTitle(vc, self, @"提现")
}

- (void) pressedControlToIncomeDetail {
    YCIncomeDetailVC *vc = [YCIncomeDetailVC new];
    CurrentViewControllerBackAndTitle(vc, self, @"收益明细")
}
- (void) pressedControlToWithdrawDetail {
    YCWithdrawDetailVC *vc = [YCWithdrawDetailVC new];
    CurrentViewControllerBackAndTitle(vc, self, @"提现明细")
}


@end
