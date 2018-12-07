//
//  YCWithdrawAccountVC.m
//  juhao
//
//  Created by muzico on 2018/12/7.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCWithdrawAccountVC.h"
#import "YCWithdrawAccountView1.h"
#import "YCWithdrawAccountView2.h"

@interface YCWithdrawAccountVC ()

@end

@implementation YCWithdrawAccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.lqs_backgroundColor = @"#ededed";
    
    
    
    NSMutableArray *keepArray = [NSMutableArray array];
    
    {
        YCWithdrawAccountView1 *targetView = [YCWithdrawAccountView1 lqs_viewWithXIB];
        targetView.textField.placeholder = @"请输入支付宝账号";
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 40;
        item.insets = UIEdgeInsetsMake(8, 8, 0, 8);
        
        [keepArray addObject:item];
    }
    {
        YCWithdrawAccountView1 *targetView = [YCWithdrawAccountView1 lqs_viewWithXIB];
        targetView.textField.placeholder = @"请输入收款人的真实姓名";
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 40;
        item.insets = UIEdgeInsetsMake(8, 8, 0, 8);
        
        [keepArray addObject:item];
    }
    {
        YCWithdrawAccountView2 *targetView = [YCWithdrawAccountView2 lqs_viewWithXIB];
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 100;
        item.insets = UIEdgeInsetsMake(10, 8, 0, 8);
        
        [keepArray addObject:item];
    }
    {
        UIButton *targetView = [UIButton new];
        targetView.lqs_backgroundColor = @"#f25540";
        targetView.lqs_title = @"确定";
        [targetView lqs_addTarget:self action:@selector(pressedButtonToSure)];
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 44;
        item.insets = UIEdgeInsetsMake(20, 8, 0, 8);
        
        [keepArray addObject:item];
    }
    
    CommonScrollView2 *scrollView = [CommonScrollView2 new];
    scrollView.items = keepArray;
    [self lqs_boxControllerWithFillView:scrollView];
}


- (void) pressedButtonToSure {
    
}

@end
