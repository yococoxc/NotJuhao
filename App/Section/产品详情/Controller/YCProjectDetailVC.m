//
//  YCProjectDetailVC.m
//  juhao
//
//  Created by muzico on 2018/11/29.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCProjectDetailVC.h"

#import "YCProjectDetailHeadView.h"
#import "YCProjectDetailBottomView.h"

@interface YCProjectDetailVC ()

@property(nonatomic,strong) LQSBoxView *boxView;

@end

@implementation YCProjectDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    LQSBoxView *boxView = [LQSBoxView new];
    boxView.headViewHeight = 44;
    boxView.footViewHeight = 49;
    [boxView loadHeadView:[YCProjectDetailHeadView lqs_viewWithXIB]];
    [boxView loadFootView:[YCProjectDetailBottomView lqs_viewWithXIB]];
    
//    [self.view addSubview:boxView];
    [self lqs_boxControllerWithFillView:boxView];
    self.boxView = boxView;
}

//- (void) lqs_boxControllerWithBoxViewReloadLayout {
//    self.boxView.frame = self.view.bounds;
//
//}

@end
