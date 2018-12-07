//
//  YCTestVC.m
//  juhao
//
//  Created by muzico on 2018/11/29.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCTestVC.h"

#import "AAViewController.h"

@interface YCTestVC ()

@end

@implementation YCTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.headView.lqs_backgroundColor = @"R";
    self.footView.lqs_backgroundColor = @"R";
    
    self.footViewEnable = YES;
    self.headViewEnable = YES;
    
    [self bodyViewLoadViewController:[AAViewController new]];
}

@end
