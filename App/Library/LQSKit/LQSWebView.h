//
//  LQSWebView.h
//  LQSKit
//
//  Created by muzico on 2018/7/24.
//  Copyright © 2018年 muzico. All rights reserved.
//

#import "LQSBasicViewTemplate.h"

#import <WebKit/WebKit.h>

typedef NS_ENUM(NSUInteger, LQSWebViewStyle) {
    LQSWebViewStyleAuto,
    LQSWebViewStyleWKWebView,
    LQSWebViewStyleUIWebView,
};

@interface LQSWebView : LQSBasicViewTemplate

@property(nonatomic,assign) LQSWebViewStyle style;

@property(nonatomic,strong,readonly) UIWebView* uiWebView;

@property(nonatomic,strong,readonly) WKWebView* wkWebView;

- (void) loadRequestURLString:(NSString*)urlString;

- (void) loadRequest:(NSURLRequest*)request;

- (void) loadHTMLString:(NSString*)string;

- (void) loadHTMLString:(NSString*)string baseURL:(NSURL*)baseURL;

@end

/**************
 WKWebView，是iOS 8 开始有的组件。
 你需要确定是从iOS 8 开始支持才可以硬性指定。
 否则请使用默认，默认会自动切换到适合。
 *************/
