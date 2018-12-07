//
//  YCWithdrawVC.m
//  juhao
//
//  Created by muzico on 2018/12/7.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCWithdrawVC.h"

#import "YCWithdrawView1.h"
#import "YCWithdrawView2.h"
#import "YCWithdrawView3.h"

#import "YCWithdrawAccountVC.h"

@interface YCWithdrawVC ()

@end

@implementation YCWithdrawVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.lqs_backgroundColor = @"#ededed";
    
    NSMutableArray *keepArray = [NSMutableArray array];
    
    {
        YCWithdrawView1 *targetView = [YCWithdrawView1 lqs_viewWithXIB];
        [targetView.button lqs_addTarget:self action:@selector(pressedButtonToAddAccount)];
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 40;
        item.insets = UIEdgeInsetsMake(8, 8, 0, 8);
        
        [keepArray addObject:item];
    }
    {
        YCWithdrawView2 *targetView = [YCWithdrawView2 lqs_viewWithXIB];
        [targetView lqs_addTarget:self action:@selector(pressedControlDidEidt)];
        [targetView.button lqs_addTarget:self action:@selector(pressedButtonToWithdrawAll)];
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 130;
        item.insets = UIEdgeInsetsMake(0, 8, 0, 8);
        
        [keepArray addObject:item];
    }
    {
        UIButton *targetView = [UIButton new];
        targetView.lqs_backgroundColor = @"#f25540";
        targetView.lqs_title = @"提现";
        [targetView lqs_addTarget:self action:@selector(pressedButtonToWithdraw)];
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 44;
        item.insets = UIEdgeInsetsMake(20, 8, 0, 8);
        
        [keepArray addObject:item];
    }
    {
        YCWithdrawView3 *targetView = [YCWithdrawView3 lqs_viewWithXIB];
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 60;
        item.insets = UIEdgeInsetsMake(10, 8, 0, 8);
        
        [keepArray addObject:item];
    }
    
    CommonScrollView2 *scrollView = [CommonScrollView2 new];
    scrollView.items = keepArray;
    [self lqs_boxControllerWithFillView:scrollView];
}

- (void) pressedButtonToWithdraw {
    
}

- (void) pressedControlDidEidt {
    //收起键盘
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

- (void) pressedButtonToWithdrawAll {
    
}

- (void) pressedButtonToAddAccount {
    YCWithdrawAccountVC *vc = [YCWithdrawAccountVC new];
    CurrentViewControllerBackAndTitle(vc, self, @"提现账号")
}

@end
