//
//  YCMineHomeHeadView.m
//  juhao
//
//  Created by muzico on 2018/11/29.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCMineHomeHeadView.h"

#import "YCSettingVC.h"
#import "YCPersonalInformationEditVC.h"
#import "YCLatestNewsVC.h"

@implementation YCMineHomeHeadView


- (IBAction)pressedButtonWithLeftToDoSomething:(UIButton *)sender {
    LQSBoxController *vc = LQSBoxCreateWithBackAndTitle([YCSettingVC lqs_controllerWithNib], @"设置");
    UIViewController *currentVC = [self lqs_currentViewControllerWithClass:[LQSBoxController class]];
    [currentVC lqs_currentNavigationControllerPushViewController:vc];
}

- (IBAction)pressedButtonWithRightToDoSomething:(UIButton *)sender {
    LQSBoxController *vc = LQSBoxCreateWithBackAndTitle([YCLatestNewsVC lqs_controllerWithNib], @"最新动态");
    UIViewController *currentVC = [self lqs_currentViewControllerWithClass:[LQSBoxController class]];
    [currentVC lqs_currentNavigationControllerPushViewController:vc];
}

- (IBAction)pressedButtonWithAvatar:(UIButton *)sender {
    LQSBoxController *vc = LQSBoxCreateWithBackAndTitle([YCPersonalInformationEditVC lqs_controllerWithNib], @"编辑个人资料");
    UIViewController *currentVC = [self lqs_currentViewControllerWithClass:[LQSBoxController class]];
    [currentVC lqs_currentNavigationControllerPushViewController:vc];
}


@end
