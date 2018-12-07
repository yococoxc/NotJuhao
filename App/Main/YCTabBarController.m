//
//  YCTabBarController.m
//  juhao
//
//  Created by muzico on 2018/11/29.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCTabBarController.h"
#import "YCNavigationController.h"

#import "YCHomeHomeVC.h"
#import "YCProjectHomeVC.h"
#import "YCCartHomeVC.h"
#import "YCMineHomeVC.h"

#import "YCBasicVC.h"

@interface YCTabBarController ()


@property(nonatomic, strong) YCNavigationController *homeNC;
@property(nonatomic, strong) YCNavigationController *projectNC;
@property(nonatomic, strong) YCNavigationController *cartNC;
@property(nonatomic, strong) YCNavigationController *mineNC;

@end

@implementation YCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.tabBar.translucent = NO;
    
    [self setChlidViewControllers];
    
    
    
}

#pragma mark -
- (void) setChlidViewControllers {
    NSMutableArray *childVCs = [NSMutableArray array];
    [childVCs addObject:self.homeNC];
    [childVCs addObject:self.projectNC];
    [childVCs addObject:self.cartNC];
    [childVCs addObject:self.mineNC];
    self.viewControllers = childVCs;
}

#pragma mark - lazy load
- (YCNavigationController*) homeNC {
    if (!_homeNC) {
        LQSBoxController *boxVC = LQSBoxCreate([YCHomeHomeVC lqs_controllerWithNib]);
        _homeNC = [self setupOneViewController:boxVC title:@"首页" image:@"首页" selectedImage:@"首页hover"];
    }
    return _homeNC;
}
- (YCNavigationController*) projectNC {
    if (!_projectNC) {
        LQSBoxController *boxVC = LQSBoxCreate([YCProjectHomeVC lqs_controllerWithNib]);
        _projectNC = [self setupOneViewController:boxVC title:@"项目" image:@"项目" selectedImage:@"项目hover"];
    }
    return _projectNC;
}
- (YCNavigationController*) cartNC {
    if (!_cartNC) {
        LQSBoxController *boxVC = LQSBoxCreateWithTitle([YCCartHomeVC lqs_controllerWithNib], @"购物车");
        _cartNC = [self setupOneViewController:boxVC title:@"购物车" image:@"资讯" selectedImage:@"资讯hover"];
    }
    return _cartNC;
}
- (YCNavigationController*) mineNC {
    if (!_mineNC) {
        LQSBoxController *boxVC = LQSBoxCreate([YCMineHomeVC lqs_controllerWithNib]);
        _mineNC = [self setupOneViewController:boxVC title:@"个人" image:@"个人" selectedImage:@"个人hover"];
    }
    return _mineNC;
}




//- (BOOL) shouldAutorotate {
//    return NO;
//}


#pragma amrk -
- (YCNavigationController *) setupOneViewController:(UIViewController *)vc title:(NSString *)title image:(id)image selectedImage:(id)selectedImage{
    vc.navigationItem.title = title;
    YCNavigationController *nc = [[YCNavigationController alloc] initWithRootViewController:vc];
    nc.navigationBarHidden = YES;
    
    [nc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObject:[LQS color:@"#157EFB"] forKey:NSForegroundColorAttributeName] forState:UIControlStateSelected];
    nc.tabBarItem.title = title;
    
    if ([image isKindOfClass:[UIImage class]]) {
        nc.tabBarItem.image = image;
    } else if ([image isKindOfClass:[NSString class]]) {
        nc.tabBarItem.image = [UIImage imageNamed:image];
    }
    
    if ([selectedImage isKindOfClass:[UIImage class]]) {
        nc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else if ([selectedImage isKindOfClass:[NSString class]]) {
        UIImage* tempImage = [UIImage imageNamed:selectedImage];
        if (tempImage) {
            nc.tabBarItem.selectedImage = [tempImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
    }
    return nc;
}

@end
