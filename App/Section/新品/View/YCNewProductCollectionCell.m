//
//  YCNewProductCollectionCell.m
//  juhao
//
//  Created by muzico on 2018/12/5.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCNewProductCollectionCell.h"
#import "Masonry.h"

@implementation YCNewProductCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    YCHomeProductViewCell *cell = [YCHomeProductViewCell lqs_viewWithXIB];
    [self.contentView addSubview:cell];
    [cell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.cell = cell;
}


@end
