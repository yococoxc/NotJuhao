//
//  YCWithdrawAccountView1.m
//  juhao
//
//  Created by muzico on 2018/12/7.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCWithdrawAccountView1.h"

@interface YCWithdrawAccountView1 ()<UITextFieldDelegate>

@end

@implementation YCWithdrawAccountView1

- (void) awakeFromNib {
    [super awakeFromNib];
    
    self.textField.returnKeyType = UIReturnKeyDone;
    self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField.delegate = self;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    //收起键盘
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    return YES;
}

@end
