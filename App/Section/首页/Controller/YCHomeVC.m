//
//  YCHomeVC.m
//  juhao
//
//  Created by muzico on 2018/12/1.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCHomeVC.h"

#import "YCHomeNewsView.h"
#import "YCHomeHotCategoryHeadView.h"
#import "YCHomeHotProductHeadView.h"

#import "YCLatestNewsVC.h"

#import "YCHomeProductViewCell.h"

#import "YCProjectDetailVC.h"
#import "YCProjectFilterListVC.h"



#import "SXCycleView.h"

@interface YCHomeVC ()

@property(nonatomic,strong) CommonScrollView2 *scrollView;

@end

@implementation YCHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.lqs_backgroundColor = @"#ededed";
    
    CommonScrollView2 *scrollView = [[CommonScrollView2 alloc] init];
    [self lqs_boxControllerWithFillView:scrollView];
    self.scrollView = scrollView;
    
    scrollView.items = [self viewsFromScrollView];
}





- (NSArray *) viewsFromScrollView {
    WeakSelf
    
    NSMutableArray* keepArray = [NSMutableArray array];
    
#pragma mark - 广告
    {
        SXCycleView *targetView = [SXCycleView new];
        targetView.setupCellImageBlock = ^(SXCycleView *cycleView, UIImageView *imageView, id image) {
            imageView.lqs_image = image;
        };
        targetView.didSelectCellblock = ^(SXCycleView *cycleView, NSInteger currentIndex) {
            
        };
        targetView.images = @[@"0.png",@"1.png",@"2.png",@"3.png"];
        targetView.titles = @[@"111",@"222",@"333",@"444"];
        
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 150;
        
        [keepArray addObject:item];
    }
#pragma mark - 新闻
    {
        YCHomeNewsView *targetView = [YCHomeNewsView lqs_viewWithXIB];
        [targetView.moreButton lqs_addTarget:self action:@selector(pressedButtonToNewsList)];
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 50;
        item.insets = UIEdgeInsetsMake(8, 0, 8, 0);
        
        [keepArray addObject:item];
    }
#pragma mark - 热门分类导航
    {
        YCHomeHotCategoryHeadView *targetView = [YCHomeHotCategoryHeadView lqs_viewWithXIB];
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 50;
        item.insets = UIEdgeInsetsMake(8, 0, 0, 0);
        
        [keepArray addObject:item];
    }
    {
        NSMutableArray *keepArr = [NSMutableArray array];
        for (NSUInteger index = 0; index < 6; index++) {
            [keepArr addObject:[UIImageView lqs_backgroundColor:@"R"]];
        }
        
        CommonFormView2 *targetView = [CommonFormView2 new];
        targetView.row = 3;
        targetView.column = 2;
        targetView.itemGap = 8;
        targetView.items = keepArr;
        targetView.insets = UIEdgeInsetsMake(8, 8, 8, 8);
        targetView.didSelectBlock = ^(CommonFormView2 *formView, UIView *view, NSInteger index) {
            YCProjectFilterListVC *vc = [YCProjectFilterListVC new];
            CurrentViewController(vc, weakSelf)
        };

        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 260;
        item.insets = UIEdgeInsetsMake(0, 0, 8, 0);

        [keepArray addObject:item];
    }
#pragma mark - 套餐配搭
    {
        UIView *targetView = [UIView new];
        targetView.backgroundColor = [UIColor redColor];
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 60;
        item.insets = UIEdgeInsetsMake(8, 0, 8, 0);
        
        [keepArray addObject:item];
    }
    
#pragma mark - 新品
    {
        YCHomeHotProductHeadView *targetView = [YCHomeHotProductHeadView lqs_viewWithXIB];
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 40;
        item.insets = UIEdgeInsetsMake(8, 0, 0, 0);
        
        [keepArray addObject:item];
    }
    {
        NSMutableArray *keepArr = [NSMutableArray array];
        for (NSUInteger index = 0; index < 5; index++) {
            [keepArr addObject:[YCHomeProductViewCell lqs_viewWithXIB]];
        }
        
        CommonDynamicFormView *targetView = [CommonDynamicFormView new];
        targetView.column = 2;
        targetView.itemGap = 8;
        targetView.items = keepArr;
        targetView.inset = UIEdgeInsetsMake(8, 8, 8, 8);
        targetView.itemSizeScale = 1.3;
        targetView.didSelectBlock = ^(CommonDynamicFormView *formView, YCHomeProductViewCell *view, NSInteger index) {
            YCProjectDetailVC *vc = [YCProjectDetailVC new];
            CurrentViewController(vc, weakSelf)
        };
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 0;
        item.insets = UIEdgeInsetsMake(0, 0, 8, 0);
        
        [keepArray addObject:item];
    }
    
    
#pragma mark - 猜你喜欢
    {
        YCHomeHotProductHeadView *targetView = [YCHomeHotProductHeadView lqs_viewWithXIB];
        [targetView setupWithTitle:@"猜  你  喜  欢" subtitle:@"MAY BE YOU LIKE"];
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 40;
        item.insets = UIEdgeInsetsMake(8, 0, 0, 0);
        
        [keepArray addObject:item];
    }
    {
        NSMutableArray *keepArr = [NSMutableArray array];
        for (NSUInteger index = 0; index < 5; index++) {
            [keepArr addObject:[YCHomeProductViewCell lqs_viewWithXIB]];
        }
        
        CommonDynamicFormView *targetView = [CommonDynamicFormView new];
        targetView.column = 2;
        targetView.itemGap = 8;
        targetView.items = keepArr;
        targetView.inset = UIEdgeInsetsMake(8, 8, 8, 8);
        targetView.itemSizeScale = 1.3;
        targetView.didSelectBlock = ^(CommonDynamicFormView *formView, YCHomeProductViewCell *view, NSInteger index) {
            YCProjectDetailVC *vc = [YCProjectDetailVC new];
            CurrentViewController(vc, weakSelf)
        };
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 0;
        item.insets = UIEdgeInsetsMake(0, 0, 8, 0);
        
        [keepArray addObject:item];
    }
    
    
#pragma mark - 底部广告信息
    {
        UIView *targetView = [UIView new];
        targetView.backgroundColor = [UIColor redColor];
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 250;
        item.insets = UIEdgeInsetsMake(8, 0, 8, 0);
        
        [keepArray addObject:item];
    }
    
    return keepArray;
}

- (void) pressedButtonToNewsList {
    YCLatestNewsVC *vc = [YCLatestNewsVC new];
    UIViewController* boxController = LQSBoxCreateWithBackAndTitle(vc, @"最新动态");
    UIViewController *currentVC = [self lqs_currentViewControllerWithClass:[LQSBoxController class]];
    [currentVC lqs_currentNavigationControllerPushViewController:boxController];
}

@end
