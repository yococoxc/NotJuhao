//
//  YCLatestNewsTableCell.m
//  juhao
//
//  Created by muzico on 2018/12/1.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCLatestNewsTableCell.h"

@implementation YCLatestNewsTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
