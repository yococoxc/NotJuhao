//
//  YCBasicVC.m
//  juhao
//
//  Created by muzico on 2018/11/29.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCBasicVC.h"

@interface YCBasicVC ()

@property(nonatomic,assign) BOOL loadViewFinish;

@property(nonatomic,strong) UIViewController *bodyViewController;

@end

@implementation YCBasicVC

//- (void) dealloc {
//    for (UIView *subview in self.view.subviews) {
//        for (UIView *subview2 in subview.subviews) {
//            for (UIView *subview3 in subview2.subviews) {
//                [subview3 removeFromSuperview];
//            }
//            [subview2 removeFromSuperview];
//        }
//        [subview removeFromSuperview];
//    }
//    
//    self.headView = nil;
//    self.bodyView = nil;
//    self.footView = nil;
//    
//    self.bodyViewController = nil;
//    
//}
//
//+ (instancetype) controllerWithBody:(id)bodyViewOrController head:(UIView*)head {
//    YCBasicVC *vc = [self controllerWithBody:bodyViewOrController];
//    if ([head isKindOfClass:[UIView class]]) {
//        vc.headView = head;
//        vc.headViewEnable = YES;
//    }
//    return vc;
//}
//
//+ (instancetype) controllerWithBody:(id)bodyViewOrController {
//    YCBasicVC *vc = [YCBasicVC new];
//    if ([bodyViewOrController isKindOfClass:[UIView class]]) {
//        if ([vc respondsToSelector:@selector(setBodyView:)]) {
//            vc.bodyView = bodyViewOrController;
//        }
//    } else if ([bodyViewOrController isKindOfClass:[UIViewController class]]) {
//        if ([vc respondsToSelector:@selector(setBodyViewController:)]) {
//            vc.bodyViewController = bodyViewOrController;
//        }
//    }
//    return vc;
//}
//
//- (instancetype) initWithCoder:(NSCoder *)aDecoder {
//    if (self = [super initWithCoder:aDecoder]) {
//        [self setupWithInit];
//    }
//    return self;
//}
//- (instancetype) init {
//    NSString *selfClassString = NSStringFromClass([self class]);
//    return [self initWithNibName:selfClassString bundle:nil];
//}
//- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    BOOL isOK = NO;
//    NSString *path = [[NSBundle mainBundle] bundlePath];
//    NSArray* alls = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
//    NSString* tempString = [NSString stringWithFormat:@"%@.nib", nibNameOrNil];
//    for (NSString *temp in alls) {
//        if ([temp isEqualToString:tempString]) {
//            isOK = YES;
//            break;
//        }
//    }
//    if (isOK == YES) {
//        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    }
//    if (self) {
//        [self setupWithInit];
//    }
//    return self;
//}
//
//- (void) setupWithInit {
//    self.headViewEnable = NO;
//    self.headViewHeight = 44;
//    
//    self.footViewEnable = NO;
//    self.footViewHeight = 49;
//}
//
//
//
//- (void) loadView {
//    [super loadView];
//    
//    if ([self.safeAreaView isKindOfClass:[UIView class]] == NO) {
//        return;
//    }
//    
//    if ([self.headView isKindOfClass:[UIView class]] == NO) {
//        UIView *headView = [UIView new];
//        self.headView = headView;
//    }
//    
//    if ([self.bodyView isKindOfClass:[UIView class]] == NO) {
//        UIView *bodyView = [UIView new];
//        self.bodyView = bodyView;
//    }
//    
//    if ([self.footView isKindOfClass:[UIView class]] == NO) {
//        UIView *footView = [UIView new];
//        self.footView = footView;
//    }
//    
//    [self.safeAreaView addSubview:self.headView];
//    [self.safeAreaView addSubview:self.bodyView];
//    [self.safeAreaView addSubview:self.footView];
//    
////    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.right.top.mas_equalTo(0);
////        make.height.mas_equalTo(self.headViewHeight);
////    }];
////    [self.footView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.right.bottom.mas_equalTo(0);
////        make.height.mas_equalTo(self.footViewHeight);
////    }];
////    [self.bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.right.mas_equalTo(0);
////        make.top.mas_equalTo(self.headView.mas_bottom);
////        make.bottom.mas_equalTo(self.footView.mas_top);
////    }];
//    
//    
//    self.loadViewFinish = YES;
//    
//    self.headViewEnable = _headViewEnable;
//    self.footViewEnable = _footViewEnable;
//    
//    if ([self.bodyViewController isKindOfClass:[UIViewController class]]) {
//        [self bodyViewLoadViewController:self.bodyViewController];
//    }
//}
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view from its nib.
//    
//}
//
//- (void) viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    
//    if ([self.bodyViewController isKindOfClass:[UIViewController class]]) {
//        [self.bodyViewController viewWillAppear:animated];
//    }
//}
//- (void) viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    
//    if ([self.bodyViewController isKindOfClass:[UIViewController class]]) {
//        [self.bodyViewController viewDidAppear:animated];
//    }
//}
//- (void) viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    
//    if ([self.bodyViewController isKindOfClass:[UIViewController class]]) {
//        [self.bodyViewController viewWillDisappear:animated];
//    }
//}
//- (void) viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    
//    if ([self.bodyViewController isKindOfClass:[UIViewController class]]) {
//        [self.bodyViewController viewDidDisappear:animated];
//    }
//}
//
//- (void) setHeadViewEnable:(BOOL)headViewEnable {
//    _headViewEnable = headViewEnable;
//    
//    if (self.loadViewFinish == NO) {
//        return;
//    }
//    
//    if ([self.headView isKindOfClass:[UIView class]] == NO) {
//        return;
//    }
//    
//    self.headView.hidden = !headViewEnable;
//    
//    if (headViewEnable == YES) {
//        [self.headView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(self.headViewHeight);
//        }];
//    } else {
//        [self.headView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(0);
//        }];
//    }
//}
//- (void) setFootViewEnable:(BOOL)footViewEnable {
//    _footViewEnable = footViewEnable;
//    
//    if (self.loadViewFinish == NO) {
//        return;
//    }
//    
//    if ([self.footView isKindOfClass:[UIView class]] == NO) {
//        return;
//    }
//    
//    self.footView.hidden = !footViewEnable;
//    
//    if (footViewEnable == YES) {
//        [self.footView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(self.footViewHeight);
//        }];
//    } else {
//        [self.footView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(0);
//        }];
//    }
//}
//
//- (void) bodyViewLoadViewController:(UIViewController *)viewController {
//    if ([self.bodyView isKindOfClass:[UIView class]] == NO) {
//        return;
//    }
//    
//    for (UIView *subview in self.bodyView.subviews) {
//        [subview removeFromSuperview];
//    }
//    
//    if ([viewController isKindOfClass:[UIViewController class]]) {
//        UIView *tempView = viewController.view;
//        [self.bodyView addSubview:tempView];
//        [tempView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.mas_equalTo(0);
//        }];
//        self.bodyViewController = viewController;
//    }
//}

@end
