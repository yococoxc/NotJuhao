//
//  YCCategoryFilterVC.m
//  juhao
//
//  Created by muzico on 2018/11/29.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCCategoryFilterVC.h"
#import "YCProjectFilterListVC.h"

@interface YCCategoryFilterVC ()

@end

@implementation YCCategoryFilterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)pressedControlToAllCategory:(UIControl *)sender {
    
    UIViewController* vc = LQSBoxCreate([YCProjectFilterListVC lqs_controllerWithNib]);
    
    UIViewController *currentVC = [self lqs_currentViewControllerWithClass:[LQSBoxController class]];
    [currentVC lqs_currentNavigationControllerPushViewController:vc];
}

@end
