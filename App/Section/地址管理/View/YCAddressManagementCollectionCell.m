//
//  YCAddressManagementCollectionCell.m
//  juhao
//
//  Created by muzico on 2018/12/7.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCAddressManagementCollectionCell.h"

@implementation YCAddressManagementCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    [self.customControl lqs_addTarget:self action:@selector(pressedButtonToDefault)];
    
    [self.deleteButton lqs_setLayerBorderWidth:1 borderColor:@"#808080"];
    [self.deleteButton lqs_setLayerCornerRadius:8];
    [self.deleteButton lqs_setLayerMasksToBounds:YES];
    [self.deleteButton lqs_addTarget:self action:@selector(pressedButtonToDelete)];
    
    [self.editButton lqs_setLayerBorderWidth:1 borderColor:@"#808080"];
    [self.editButton lqs_setLayerCornerRadius:8];
    [self.editButton lqs_setLayerMasksToBounds:YES];
    [self.editButton lqs_addTarget:self action:@selector(pressedButtonToEdit)];
    
    
}

- (void) pressedButtonToDefault {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ycAddressManagementCollectionCell:defaultActionAtIndex:)]) {
        [self.delegate ycAddressManagementCollectionCell:self defaultActionAtIndex:self.tag];
    }
}
- (void) pressedButtonToEdit {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ycAddressManagementCollectionCell:editActionAtIndex:)]) {
        [self.delegate ycAddressManagementCollectionCell:self editActionAtIndex:self.tag];
    }
}
- (void) pressedButtonToDelete {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ycAddressManagementCollectionCell:deleteActionAtIndex:)]) {
        [self.delegate ycAddressManagementCollectionCell:self deleteActionAtIndex:self.tag];
    }
}

@end
