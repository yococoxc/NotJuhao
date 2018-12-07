//
//  YCPersonalInformationEditVC.m
//  juhao
//
//  Created by muzico on 2018/11/29.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCPersonalInformationEditVC.h"

#import "YCPersonalInformationHeadView.h"


#import "YCResetPasswordVC.h"

@interface YCPersonalInformationEditVC ()<CommonTableViewDelegate>

@property(nonatomic,strong) NSArray *tableDataSource;

@property(nonatomic,strong) CommonFixView *fixView;

@end

@implementation YCPersonalInformationEditVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    YCPersonalInformationHeadView *headView = [YCPersonalInformationHeadView lqs_viewWithXIB];
    
    CommonFixViewItem *item = [CommonFixViewItem new];
    item.view = headView;
    item.height = 180;
    
    CommonTableView *tableView = [CommonTableView createWithCommonDelegate:self];
    
    CommonFixView *fixView = [CommonFixView new];
    fixView.items = @[item];
    fixView.otherView = tableView;
    [self lqs_boxControllerWithFillView:fixView];
//    [self.view addSubview:fixView];
    self.fixView = fixView;
    
    
    NSArray *dataSource = @[
                            @{@"name": @"昵称"},
                            @{@"name": @"性别", @"end icon": @"箭头"},
                            @{@"name": @"生日", @"end icon": @"箭头"},
                            @{@"name": @"修改密码", @"end icon": @"箭头"},
                            ];
    self.tableDataSource = dataSource;
    tableView.tableDataSource = self.tableDataSource;
    
    
}

//- (void) lqs_boxControllerWithBoxViewReloadLayout {
//    
//    self.fixView.frame = self.view.bounds;
//}


#pragma mark - CommonTableViewDelegate
- (void) commonTableView:(CommonTableView *)tableView didSelectWithDataSource:(NSDictionary *)dataSource atIndex:(NSInteger)index {
    
    NSString *name = [dataSource lqs_toStringWithObjectForKey:@"name"];
    if ([name lqs_isEqualToString:@"昵称"]) {
        
    } else if ([name lqs_isEqualToString:@"性别"]) {
        
    } else if ([name lqs_isEqualToString:@"生日"]) {
        
    } else if ([name lqs_isEqualToString:@"修改密码"]) {
        UIViewController *currentVC = [self lqs_currentViewControllerWithClass:[LQSBoxController class]];
        UIViewController *vc = LQSBoxCreateWithBackAndTitle([YCResetPasswordVC lqs_controllerWithNib], @"重置密码");
        [currentVC lqs_currentNavigationControllerPushViewController:vc];
    }
}

@end
