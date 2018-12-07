//
//  YCAddressManagementCollectionCell.h
//  juhao
//
//  Created by muzico on 2018/12/7.
//  Copyright © 2018 muzico. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YCAddressManagementCollectionCell;

@protocol YCAddressManagementCollectionCellDelegate<NSObject>

@optional
- (void) ycAddressManagementCollectionCell:(YCAddressManagementCollectionCell *)cell defaultActionAtIndex:(NSInteger)index;
- (void) ycAddressManagementCollectionCell:(YCAddressManagementCollectionCell *)cell editActionAtIndex:(NSInteger)index;
- (void) ycAddressManagementCollectionCell:(YCAddressManagementCollectionCell *)cell deleteActionAtIndex:(NSInteger)index;

@end

@interface YCAddressManagementCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;




@property (weak, nonatomic) IBOutlet UIButton *editButton;

@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@property (weak, nonatomic) IBOutlet UIControl *customControl;

@property(nonatomic,weak) id<YCAddressManagementCollectionCellDelegate> delegate;

@end

