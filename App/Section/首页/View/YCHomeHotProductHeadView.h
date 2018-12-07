//
//  YCHomeHotProductHeadView.h
//  juhao
//
//  Created by muzico on 2018/12/5.
//  Copyright © 2018 muzico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCHomeHotProductHeadView : UIView

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

- (void) setupWithTitle:(NSString *)title subtitle:(NSString *)subtitle;


@end
