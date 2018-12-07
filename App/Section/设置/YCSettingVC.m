//
//  YCSettingVC.m
//  juhao
//
//  Created by muzico on 2018/11/29.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCSettingVC.h"

@interface YCSettingVC ()

@end

@implementation YCSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.lqs_backgroundColor = @"#ededed";
    
    LQSBoxView *boxView = [LQSBoxView new];
    [self.view addSubview:boxView];
    
    [self sadda:boxView];
}

- (void) sadda:(UIView *) aaa {
    
}

@end
