//
//  YCWithdrawView2.m
//  juhao
//
//  Created by muzico on 2018/12/7.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCWithdrawView2.h"

@implementation YCWithdrawView2

- (void) awakeFromNib {
    [super awakeFromNib];
    
    self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
}

@end
