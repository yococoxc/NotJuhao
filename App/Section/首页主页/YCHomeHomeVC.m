//
//  YCHomeHomeVC.m
//  juhao
//
//  Created by muzico on 2018/11/29.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCHomeHomeVC.h"
#import "YCHomeVC.h"
#import "YCNewProductVC.h"
#import "YCVideoVC.h"
#import "YCLimitedTimePurchaseVC.h"
#import "JuhaoSupermarketVC.h"
#import "YCDiscoverDesignerVC.h"

@interface YCHomeHomeVC ()

@property(nonatomic,strong) CommonPageScrollView2 *pageScrollView;

@property (strong, nonatomic) YCHomeVC *homeVC;
@property (strong, nonatomic) YCNewProductVC *thenewProductVC;
@property (strong, nonatomic) YCVideoVC *videoVC;
@property (strong, nonatomic) YCLimitedTimePurchaseVC *limitedTimePurchaseVC;
@property (strong, nonatomic) JuhaoSupermarketVC *juhaoSupermarketVC;
@property (strong, nonatomic) YCDiscoverDesignerVC *discoverDesignerVC;
@property (strong, nonatomic)CommonControlBarView *controlBarView;

@end

@implementation YCHomeHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    __weak typeof(self) weakSelf = self;
    
    CommonControlBarView *controlBarView = [CommonControlBarView new];
    controlBarView.didSeletBlock = ^(CommonControlBarView *controlBar, NSString *title, NSInteger index) {
        [weakSelf.pageScrollView setContentOffset:CGPointMake(weakSelf.pageScrollView.frame.size.width * index, 0) animated:YES];
    };
    controlBarView.titles = @[@"首页", @"新品", @"视频", @"限时购", @"超市", @"发现"];
    controlBarView.currentIndex = 0;
    self.controlBarView = controlBarView;
    
    self.homeVC = [YCHomeVC new];
    self.thenewProductVC = [YCNewProductVC new];
    self.videoVC = [YCVideoVC new];
    self.limitedTimePurchaseVC = [YCLimitedTimePurchaseVC new];
    self.juhaoSupermarketVC = [JuhaoSupermarketVC new];
    self.discoverDesignerVC = [YCDiscoverDesignerVC new];
    
    
    CommonPageScrollView2 *pageScrollView = [CommonPageScrollView2 new];
    pageScrollView.scrollPageBlock = ^(CommonPageScrollView2 *scrollView, NSInteger page) {
        weakSelf.controlBarView.currentIndex = page;
    };
    pageScrollView.frame = self.view.bounds;
    pageScrollView.items = @[
                             self.homeVC.view,
                             self.thenewProductVC.view,
                             self.videoVC.view,
                             self.limitedTimePurchaseVC.view,
                             self.juhaoSupermarketVC.view,
                             self.discoverDesignerVC.view,
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
    
    [self.homeVC lqs_boxControllerWithBoxViewReloadLayout];
    [self.thenewProductVC lqs_boxControllerWithBoxViewReloadLayout];
    [self.videoVC lqs_boxControllerWithBoxViewReloadLayout];
    [self.limitedTimePurchaseVC lqs_boxControllerWithBoxViewReloadLayout];
    [self.juhaoSupermarketVC lqs_boxControllerWithBoxViewReloadLayout];
    [self.discoverDesignerVC lqs_boxControllerWithBoxViewReloadLayout];
}

@end
