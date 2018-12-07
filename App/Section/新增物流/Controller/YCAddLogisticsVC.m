//
//  YCAddLogisticsVC.m
//  juhao
//
//  Created by muzico on 2018/12/7.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCAddLogisticsVC.h"
#import "YCAddLogisticsHeadView.h"
#import "YCAddressManagementBottomView.h"

@interface YCAddLogisticsVC ()

@end

@implementation YCAddLogisticsVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.lqs_backgroundColor = @"#ededed";
    
    //底部按钮
    YCAddressManagementBottomView *bottomView = [YCAddressManagementBottomView lqs_viewWithXIB];
    bottomView.button.lqs_title = @"保存";
    bottomView.backgroundColor = [UIColor clearColor];
    [bottomView.button lqs_addTarget:self action:@selector(pressedButtonToKeep)];
    
    //顶部内容
    YCAddLogisticsHeadView *headView = [YCAddLogisticsHeadView lqs_viewWithXIB];
    
    //中间内容
    UIControl *control = [UIControl new];
    [control lqs_addTarget:self action:@selector(pressedControlDidEidt)];
    
    //容器
    LQSBoxView *boxView = [LQSBoxView new];
    [boxView loadHeadView:headView];
    boxView.headViewHeight = 180;
    [boxView loadBodyView:control];
    [boxView loadFootView:bottomView];
    boxView.footViewHeight = 60;
    [self lqs_boxControllerWithFillView:boxView];
}


- (void) pressedControlDidEidt {
    //收起键盘
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}


- (void) pressedButtonToKeep {
    
}

@end
