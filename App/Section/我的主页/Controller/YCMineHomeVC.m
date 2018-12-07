//
//  YCMineHomeVC.m
//  juhao
//
//  Created by muzico on 2018/11/29.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCMineHomeVC.h"


#import "YCMineHomeHeadView.h"
#import "YCMineHomeMyOrderView.h"

#import "YCMineHomeMyServiceView.h"
#import "YCMineHomeMyServiceViewCell.h"

#import "YCOrderVC.h"

#import "YCAddressManagementVC.h"
#import "YCLogisticsManagementVC.h"
#import "YCFootprintVC.h"
#import "YCCollectionVC.h"
#import "YCSettingVC.h"
#import "YCMyIncomeVC.h"

@interface YCMineHomeVC ()

@property(nonatomic,strong) YCMineHomeHeadView *headView;

@property(nonatomic,strong) CommonScrollView2 *scrollView;

@property(nonatomic,strong) CommonFixView *fixView;

@end

@implementation YCMineHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.lqs_backgroundColor = @"#ededed";
    
    YCMineHomeHeadView *headView = [YCMineHomeHeadView lqs_viewWithXIB];
    self.headView = headView;
    
    CommonFixViewItem *headViewItem = [CommonFixViewItem new];
    headViewItem.height = 130;
    headViewItem.view = headView;
    
    CommonScrollView2 *scrollView = [CommonScrollView2 new];
    self.scrollView = scrollView;
    scrollView.items = [self viewsFromScrollView];
    
    CommonFixView *fixView = [CommonFixView new];
    fixView.items = @[headViewItem];
    fixView.otherView = scrollView;
    [self lqs_boxControllerWithFillView:fixView];
    self.fixView = fixView;
    
}

- (NSArray<NSDictionary *> *) arrayOfDataSource {
    NSMutableArray *keepArray = [NSMutableArray array];
    
    [keepArray addObject:@{@"name": @"地址管理"}];
    [keepArray addObject:@{@"name": @"物流管理"}];
    [keepArray addObject:@{@"name": @"分享"}];
    [keepArray addObject:@{@"name": @"足迹"}];
    [keepArray addObject:@{@"name": @"收藏"}];
    [keepArray addObject:@{@"name": @"服务"}];
    [keepArray addObject:@{@"name": @"联系客服"}];
    [keepArray addObject:@{@"name": @"设置"}];
    [keepArray addObject:@{@"name": @"我的收益"}];
    [keepArray addObject:@{@"name": @"我的分销商"}];
    [keepArray addObject:@{@"name": @"邀请码"}];
    
    return keepArray;
}

- (NSArray<NSDictionary *> *) myOrderDataSource {
    NSMutableArray *keepArray = [NSMutableArray array];
    
    [keepArray addObject:@{@"name": @"待付款"}];
    [keepArray addObject:@{@"name": @"待发货"}];
    [keepArray addObject:@{@"name": @"待收货"}];
    
    return keepArray;
}

- (NSArray<UIView *> *) arrayOfViewFromDataSource:(NSArray *)dataSource {
    NSMutableArray *keepArray = [NSMutableArray array];
    
    for (NSDictionary *dictionary in dataSource) {
        YCMineHomeMyServiceViewCell *temp = [YCMineHomeMyServiceViewCell lqs_viewWithXIB];
        temp.titleLabel.text = [dictionary objectForKey:@"name"];
        [keepArray addObject:temp];
    }
    
    return keepArray;
}




- (NSArray *) viewsFromScrollView {
    WeakSelf
    
    NSMutableArray* keepArray = [NSMutableArray array];
#pragma mark - 我的订单
    {
        YCMineHomeMyOrderView *targetView = [YCMineHomeMyOrderView lqs_viewWithXIB];
        [targetView.control lqs_addTarget:self action:@selector(pressedControlToOrderVC)];
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 44;
        item.insets = UIEdgeInsetsMake(0, 0, 8, 0);
        
        [keepArray addObject:item];
    }
    {
        CommonFormView2 *targetView = [CommonFormView2 new];
        targetView.backgroundColor = [UIColor orangeColor];
        targetView.column = 3;
        targetView.row = 1;
        targetView.itemGap = 0;
        targetView.items = [self arrayOfViewFromDataSource:[self myOrderDataSource]];
        targetView.insets = UIEdgeInsetsZero;
        targetView.didSelectBlock = ^(CommonFormView2 *formView, UIView *view, NSInteger index) {
            
            YCOrderVC *vc = [YCOrderVC new];
            CurrentViewControllerBackAndTitle(vc, weakSelf, @"我的订单")
        };
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 80;
        item.insets = UIEdgeInsetsMake(0, 0, 8, 0);
        
        [keepArray addObject:item];
    }
#pragma mark - 我的服务
    {
        UIView *targetView = [YCMineHomeMyServiceView lqs_viewWithXIB];
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = 40;
        item.insets = UIEdgeInsetsMake(8, 0, 8, 0);
        
        [keepArray addObject:item];
    }
    {
        CommonDynamicFormView *targetView = [CommonDynamicFormView new];
        targetView.column = 3;
        targetView.itemGap = 0;
        targetView.items = [self arrayOfViewFromDataSource:[self arrayOfDataSource]];
        targetView.inset = UIEdgeInsetsZero;
        targetView.itemHeight = 80;
        targetView.didSelectBlock = ^(CommonDynamicFormView *formView, id view, NSInteger index) {
            [weakSelf didSelectItemWithMyServiceDataSourceAtIndex:index];
        };
        
        CommonScrollViewItem *item = [CommonScrollViewItem new];
        item.view = targetView;
        item.height = targetView.viewHeight;
        item.insets = UIEdgeInsetsMake(0, 0, 8, 0);
        
        [keepArray addObject:item];
    }
    return keepArray;
}


- (void) pressedControlToOrderVC {
    YCOrderVC *vc = [YCOrderVC new];
    CurrentViewControllerBackAndTitle(vc, self, @"我的订单")
}

- (void) didSelectItemWithMyServiceDataSourceAtIndex:(NSInteger)index {
    NSLog(@"index ==== %ld", index);
    NSDictionary *dictionary = [[self arrayOfDataSource] objectAtIndex:index];
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        NSString *name = [dictionary objectForKey:@"name"];
        if ([name isEqualToString:@"地址管理"]) {
            YCAddressManagementVC *vc = [YCAddressManagementVC new];
            CurrentViewControllerBackAndTitle(vc, self, @"地址管理")
            
        } else if ([name isEqualToString:@"物流管理"]) {
            YCLogisticsManagementVC *vc = [YCLogisticsManagementVC new];
            CurrentViewControllerBackAndTitle(vc, self, @"物流管理")
            
        } else if ([name isEqualToString:@"分享"]) {
            
        } else if ([name isEqualToString:@"足迹"]) {
            YCFootprintVC *vc = [YCFootprintVC new];
            CurrentViewControllerBackAndTitle(vc, self, @"我的足迹")
        } else if ([name isEqualToString:@"收藏"]) {
            YCCollectionVC *vc = [YCCollectionVC new];
            CurrentViewControllerBackAndTitle(vc, self, @"我的收藏")
            
        } else if ([name isEqualToString:@"服务"]) {
            
        } else if ([name isEqualToString:@"联系客服"]) {
            
        } else if ([name isEqualToString:@"设置"]) {
            YCSettingVC *vc = [YCSettingVC new];
            CurrentViewControllerBackAndTitle(vc, self, @"设置")
        } else if ([name isEqualToString:@"我的收益"]) {
            YCMyIncomeVC *vc = [YCMyIncomeVC new];
            CurrentViewControllerBackAndTitle(vc, self, @"我的收益")
        } else if ([name isEqualToString:@"我的分销商"]) {
            
        } else if ([name isEqualToString:@"邀请码"]) {
            
        }
    }
}


@end
