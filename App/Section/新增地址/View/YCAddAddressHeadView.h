//
//  YCAddAddressHeadView.h
//  juhao
//
//  Created by muzico on 2018/12/7.
//  Copyright © 2018 muzico. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface YCAddAddressHeadView : UIView

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@property (weak, nonatomic) IBOutlet UIControl *areaControl;
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;

@property (weak, nonatomic) IBOutlet UITextField *addressTextField;

@property (weak, nonatomic) IBOutlet UIControl *selectPeopleControl;

@property (weak, nonatomic) IBOutlet UIControl *positionControl;


@end
