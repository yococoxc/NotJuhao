//
//  YCAddAddressHeadView.m
//  juhao
//
//  Created by muzico on 2018/12/7.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCAddAddressHeadView.h"

@implementation YCAddAddressHeadView

- (void) awakeFromNib {
    [super awakeFromNib];
    
    self.nameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.nameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    
    self.phoneTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.phoneTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    self.addressTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.addressTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
}

@end
