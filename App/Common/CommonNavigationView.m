//
//  CommonNavigationView.m
//  juhao
//
//  Created by muzico on 2018/11/30.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "CommonNavigationView.h"

@implementation CommonNavigationView

+ (instancetype) viewWithTitle:(NSString *)title {
    CommonNavigationView *view = [[self class] lqs_viewWithXIB];
    view.backControl.hidden = YES;
    view.titleLabel.text = title;
    return view;
}
+ (instancetype) viewWithBackAndTitle:(NSString *)title {
    CommonNavigationView *view = [[self class] lqs_viewWithXIB];
    view.titleLabel.text = title;
    return view;
}


- (IBAction)pressedControlToBack:(UIControl *)sender {
    UIViewController* vc = [self lqs_currentViewControllerWithClass:[LQSBoxController class]];
    [vc lqs_currentNavigationControllerPopViewController];
}


@end
