//
//  YCProjectHomeVC.m
//  juhao
//
//  Created by muzico on 2018/11/29.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCProjectHomeVC.h"

#import "YCCategoryFilterVC.h"
#import "YCCombinationFilterVC.h"

@interface YCProjectHomeVC ()
@property (strong, nonatomic) UIViewController *categoryFilterVC;
@property (strong, nonatomic) UIViewController *combinationFilterVC;
@property (strong, nonatomic) CommonPageScrollView2 *scrollView;

@property (strong, nonatomic)CommonControlBarView *controlBarView;

@end

@implementation YCProjectHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    __weak typeof(self) weakSelf = self;
    
    CommonControlBarView *controlBarView = [CommonControlBarView new];
    controlBarView.didSeletBlock = ^(CommonControlBarView *controlBar, NSString *title, NSInteger index) {
        [weakSelf.scrollView setContentOffset:CGPointMake(weakSelf.scrollView.frame.size.width * index, 0) animated:YES];
    };
    controlBarView.titles = @[@"分类筛选", @"组合筛选"];
    controlBarView.currentIndex = 0;
    self.controlBarView = controlBarView;
    
    self.categoryFilterVC = [YCCategoryFilterVC lqs_controllerWithNib];
    self.combinationFilterVC = [YCCombinationFilterVC lqs_controllerWithNib];
    
    CommonPageScrollView2 *scrollView = [CommonPageScrollView2 new];
    scrollView.scrollPageBlock = ^(CommonPageScrollView2 *scrollView, NSInteger page) {
        weakSelf.controlBarView.currentIndex = page;
    };
    scrollView.items = @[self.categoryFilterVC.view, self.combinationFilterVC.view];
    self.scrollView = scrollView;
    
    
    LQSBoxView *boxView = [LQSBoxView new];
    boxView.headViewHeight = 44;
    [boxView loadHeadView:controlBarView];
    [boxView loadBodyView:scrollView];
    
    [self lqs_boxControllerWithFillView:boxView];
}

@end
