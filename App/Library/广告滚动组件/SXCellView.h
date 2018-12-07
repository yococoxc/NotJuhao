//
//  SXCellView.h
//  SafeAreaTest
//
//  Created by muzico on 2018/12/6.
//  Copyright © 2018 muzico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SXCellView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property(nonatomic,strong) UIView *titleBackView;

- (void)setCellImageIsUrlData:(NSDictionary *)dicData;
- (void)setCellData:(NSDictionary *)dicData;

@end
