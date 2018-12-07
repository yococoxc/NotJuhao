//
//  YCLatestNewsVC.m
//  juhao
//
//  Created by muzico on 2018/11/30.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCLatestNewsVC.h"
#import "YCLatestNewsTableCell.h"
#import "YCLatestNewsDetailVC.h"

@interface YCLatestNewsVC ()

@end

@implementation YCLatestNewsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.lqs_backgroundColor = @"#ededed";
    
    __weak typeof(self) weakSelf = self;
    
    CommonTableView *tableView = [CommonTableView new];
    //指定cell
    tableView.customCell = NSStringFromClass([YCLatestNewsTableCell class]);
    //指定cell高度
    tableView.cellHeight = 80;
    //配置cell
    tableView.setupCellBlock = ^(CommonTableView *tableView, YCLatestNewsTableCell *cell, id dataSource, NSInteger index) {
        cell.cellTitleLabel.text = dataSource;
    };
    //选中cell
    tableView.didSelectBlock = ^(CommonTableView *tableView, NSInteger index) {
        NSLog(@"index >>>>> %ld", index);
        
        YCLatestNewsDetailVC* targetVC = [YCLatestNewsDetailVC new];
        targetVC.urlString = @"www.baidu.com";
        
        UIViewController *vc = LQSBoxCreateWithBackAndTitle(targetVC, @"详情");
        [[weakSelf.view lqs_currentViewControllerWithClass:[LQSBoxController class]] lqs_currentNavigationControllerPushViewController:vc];
    };
    [self lqs_boxControllerWithFillView:tableView];
    
    
    tableView.tableDataSource = @[@"1",@"2",@"3",@"4",@"5",@"5",@"w",@"r",@"b",@"s",@"v",@"o"];
}

@end
