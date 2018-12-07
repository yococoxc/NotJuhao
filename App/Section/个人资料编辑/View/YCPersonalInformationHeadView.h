//
//  YCPersonalInformationHeadView.h
//  juhao
//
//  Created by muzico on 2018/11/30.
//  Copyright © 2018 muzico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCPersonalInformationHeadView : UIView


@property (weak, nonatomic) IBOutlet UIButton *avatarButton;

- (IBAction)pressedButtonToAvatar:(UIButton *)sender;

@end
