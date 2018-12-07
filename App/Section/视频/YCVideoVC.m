//
//  YCVideoVC.m
//  juhao
//
//  Created by muzico on 2018/12/1.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCVideoVC.h"

#import "YCPromotionalVideoVC.h"
#import "YCTutorialVideoVC.h"

@interface YCVideoVC ()

@property(nonatomic,strong) CommonControlBarView *controlBarView;
@property(nonatomic,strong) CommonPageScrollView2 *pageScrollView;

@property(nonatomic,strong) YCPromotionalVideoVC *promotionalVideoVC;
@property(nonatomic,strong) YCTutorialVideoVC *tutorialVideoVC;


@end

@implementation YCVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tutorialVideoVC = [YCTutorialVideoVC new];
    
    self.promotionalVideoVC = [YCPromotionalVideoVC new];
    
    
    __weak typeof(self) weakSelf = self;
    
    CommonControlBarView *controlBarView = [CommonControlBarView new];
    controlBarView.didSeletBlock = ^(CommonControlBarView *controlBar, NSString *title, NSInteger index) {
        [weakSelf.pageScrollView setContentOffset:CGPointMake(weakSelf.pageScrollView.frame.size.width * index, 0) animated:YES];
    };
    controlBarView.titles = @[@"宣传视频", @"教程视频"];
    controlBarView.currentIndex = 0;
    self.controlBarView = controlBarView;
    
    CommonPageScrollView2 *pageScrollView = [CommonPageScrollView2 new];
    pageScrollView.scrollPageBlock = ^(CommonPageScrollView2 *scrollView, NSInteger page) {
        weakSelf.controlBarView.currentIndex = page;
    };
    pageScrollView.frame = self.view.bounds;
    pageScrollView.items = @[
                             self.promotionalVideoVC.view,
                             self.tutorialVideoVC.view,
                             ];
    self.pageScrollView = pageScrollView;
    
    
    LQSBoxView *boxView = [LQSBoxView new];
    boxView.headViewHeight = 44;
    [boxView loadHeadView:controlBarView];
    [boxView loadBodyView:pageScrollView];
    
    [self lqs_boxControllerWithFillView:boxView];
    
    
}


- (void) lqs_boxControllerWithBoxViewReloadLayout {
    [super lqs_boxControllerWithBoxViewReloadLayout];
    
    [self.promotionalVideoVC lqs_boxControllerWithBoxViewReloadLayout];
    [self.tutorialVideoVC lqs_boxControllerWithBoxViewReloadLayout];
}

@end
