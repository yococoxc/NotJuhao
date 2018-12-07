//
//  YCHomeHotProductHeadView.m
//  juhao
//
//  Created by muzico on 2018/12/5.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCHomeHotProductHeadView.h"

@implementation YCHomeHotProductHeadView

- (void) setupWithTitle:(NSString *)title subtitle:(NSString *)subtitle {
    self.titleLabel.text = title;
    self.subtitleLabel.text = subtitle;
}

@end
