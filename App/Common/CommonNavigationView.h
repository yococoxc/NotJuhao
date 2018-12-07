//
//  CommonNavigationView.h
//  juhao
//
//  Created by muzico on 2018/11/30.
//  Copyright © 2018 muzico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonNavigationView : UIView

@property (weak, nonatomic) IBOutlet UIControl *backControl;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (IBAction)pressedControlToBack:(UIControl *)sender;

+ (instancetype) viewWithTitle:(NSString *)title;
+ (instancetype) viewWithBackAndTitle:(NSString *)title;

@end
