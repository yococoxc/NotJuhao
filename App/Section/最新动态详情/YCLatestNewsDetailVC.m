//
//  YCLatestNewsDetailVC.m
//  juhao
//
//  Created by muzico on 2018/12/1.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCLatestNewsDetailVC.h"

@interface YCLatestNewsDetailVC ()


@end

@implementation YCLatestNewsDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    LQSWebView *webView = [LQSWebView new];
//    [self.view addSubview:webView];
//    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(0);
//    }];
    
    [self lqs_boxControllerWithFillView:webView];
    if (self.urlString) {
        [webView loadRequestURLString:self.urlString];
    }
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%s",__func__);
}

@end
