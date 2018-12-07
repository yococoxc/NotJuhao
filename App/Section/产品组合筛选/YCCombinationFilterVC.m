//
//  YCCombinationFilterVC.m
//  juhao
//
//  Created by muzico on 2018/11/29.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCCombinationFilterVC.h"
#import "YCProjectFilterListVC.h"

@interface YCCombinationFilterVC ()

@end

@implementation YCCombinationFilterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)pressedButtonToSure:(UIButton *)sender {
    UIViewController* vc = LQSBoxCreate([YCProjectFilterListVC lqs_controllerWithNib]);
    
    UIViewController *currentVC = [self lqs_currentViewControllerWithClass:[LQSBoxController class]];
    [currentVC lqs_currentNavigationControllerPushViewController:vc];
}

@end
