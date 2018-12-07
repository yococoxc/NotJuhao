//
//  YCBasicVC.h
//  juhao
//
//  Created by muzico on 2018/11/29.
//  Copyright © 2018 muzico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCBasicVC : UIViewController

@property (weak, nonatomic) IBOutlet UIView *safeAreaView;

@property (strong, nonatomic) UIView* headView;

@property (strong, nonatomic) UIView* bodyView;

@property (strong, nonatomic) UIView* footView;

//44
@property (assign, nonatomic) CGFloat headViewHeight;
//49
@property (assign, nonatomic) CGFloat footViewHeight;
//No
@property (assign, nonatomic) BOOL headViewEnable;
//No
@property (assign, nonatomic) BOOL footViewEnable;


- (void) bodyViewLoadViewController:(UIViewController *)viewController;

/**
 LQSBox 为了接管 body 的Controller，需要放置的参数是 ViewController。
 */

+ (instancetype) controllerWithBody:(id)bodyViewOrController;

+ (instancetype) controllerWithBody:(id)bodyViewOrController head:(UIView*)head;

@end
