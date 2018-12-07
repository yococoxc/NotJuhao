//
//  AAViewController.m
//  juhao
//
//  Created by muzico on 2018/11/29.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "AAViewController.h"

#import "ViewControllerBB.h"




@interface AAViewController ()

@end

@implementation AAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)fdgghjh:(id)sender {
    LQSBoxController *vc = LQSBoxCreate([ViewControllerBB lqs_controllerWithNib]);
    [self.view.lqs_currentViewController presentViewController:vc animated:YES completion:^{

    }];
}


@end
