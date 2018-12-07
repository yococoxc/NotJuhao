//
//  YCAddLogisticsHeadView.m
//  juhao
//
//  Created by muzico on 2018/12/7.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCAddLogisticsHeadView.h"

@implementation YCAddLogisticsHeadView


- (void) awakeFromNib {
    [super awakeFromNib];
    
    self.nameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.nameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    
    self.phoneTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.phoneTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    self.addressTextView.autocorrectionType = UITextAutocorrectionTypeNo;
    self.addressTextView.autocapitalizationType = UITextAutocapitalizationTypeNone;
}

@end
