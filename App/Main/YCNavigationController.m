//
//  YCNavigationController.m
//  juhao
//
//  Created by muzico on 2018/11/29.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCNavigationController.h"

@interface YCNavigationController ()<UINavigationControllerDelegate>

@property (nonatomic, strong)id popDelegate;

@property (nonatomic, assign)BOOL hiddenNavigationBar;

@property (nonatomic, assign)BOOL needLogin;

- (void)removeViewController:(UIViewController *)controller animated:(BOOL)flag;

@end

@implementation YCNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
    self.navigationBar.tintColor = [UIColor blackColor];
    //    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18],NSForegroundColorAttributeName : ZYTextBlackColor}];
    self.delegate = self;
    self.popDelegate = self.interactivePopGestureRecognizer.delegate;
}

- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //    if (_needLogin && [ZYLoginTool user].user_id.length == 0) {
    //        [[NSNotificationCenter defaultCenter] postNotificationName:@"NeedLoginNotification" object:nil];
    //        _needLogin = NO;
    //        return;
    //    }
    
    if (self.viewControllers.count != 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        //        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithTarget:self action:@selector(backAction)];
        //        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backAction)];
        
    }
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    
    if (self.viewControllers.count > 1) {
        self.interactivePopGestureRecognizer.delegate = nil;
    }else {
        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
    }
}


- (void) backAction {
    //    NSLog(@"self.topViewController ===== %@",self.topViewController);
    //    if ([self.topViewController isKindOfClass:[ZYLoginVC class]]) {
    //        [self popViewControllerAnimated:NO];
    //        return;
    //    }
    //    if (self == [UIApplication sharedApplication].keyWindow.rootViewController) {
    //        [self popViewControllerAnimated:NO];
    //        return;
    //    }
    [self popViewControllerAnimated:YES];
}

- (void)removeViewController:(UIViewController *)controller animated:(BOOL)flag
{
    NSMutableArray<__kindof UIViewController *> *controllers = [self.viewControllers mutableCopy];
    __block UIViewController *controllerToRemove = nil;
    [controllers enumerateObjectsUsingBlock:^(__kindof UIViewController * obj, NSUInteger idx, BOOL * stop) {
        if (obj == controller) {
            controllerToRemove = obj;
            *stop = YES;
        }
    }];
    if (controllerToRemove) {
        [controllers removeObject:controllerToRemove];
        [super setViewControllers:[NSArray arrayWithArray:controllers] animated:flag];
    }
}

@end
