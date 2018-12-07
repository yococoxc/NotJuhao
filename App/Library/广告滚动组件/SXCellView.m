//
//  SXCellView.m
//  SafeAreaTest
//
//  Created by muzico on 2018/12/6.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "SXCellView.h"

static NSString *const SXCellViewImageKey = @"imageKey";
static NSString *const SXCellViewTitleKey = @"titleKey";

@implementation SXCellView

#pragma mark-------------set-----------------
- (void)setCellImageIsUrlData:(NSDictionary *)dicData {
    [self setImage:dicData[SXCellViewImageKey] andIsImage:NO];
    [self setTitle:dicData[SXCellViewTitleKey]];
}

- (void)setCellData:(NSDictionary *)dicData {
    [self setImage:dicData[SXCellViewImageKey] andIsImage:YES];
    [self setTitle:dicData[SXCellViewTitleKey]];
}

- (void)setImage:(id)data andIsImage:(BOOL)isImage {
    if (isImage) {
        [_imageView setImage:(UIImage *)data];
    } else {
//        [_imageView sd_setImageWithURL:[NSURL URLWithString:(NSString *)data]];
        [_imageView setImage:[UIImage imageNamed:data]];
    }
}

- (void)setTitle:(NSString *)titleStr {
    [_titleLabel setText:titleStr];
    if ([titleStr isEqualToString:@""]) {
        [[self viewWithTag:123] setHidden:YES];
    } else {
        [[self viewWithTag:123] setHidden:NO];
    }
}

#pragma mark-------------init-----------------
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupImageView];
        [self setupTitleLabel];
    }
    return self;
}


- (void) setFrame:(CGRect)frame {
    if (CGRectEqualToRect(self.frame, frame)) {
        return;
    }
    [super setFrame:frame];
    
    [self reloadLayout];
    
}

- (void) reloadLayout {
    self.imageView.frame = self.bounds;
    self.titleBackView.frame = CGRectMake(0, self.bounds.size.height - 40, self.bounds.size.width, 40);
    self.titleLabel.frame = CGRectMake(10, self.bounds.size.height - 30, self.bounds.size.width - 80, 20);
}

- (void)setupImageView {
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:_imageView];
}

- (void)setupTitleLabel {
    UIView *titleBackView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 40, self.bounds.size.width, 40)];
    titleBackView.tag = 123;
    titleBackView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5];
    [self addSubview:titleBackView];
    self.titleBackView = titleBackView;
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.bounds.size.height - 30, self.bounds.size.width - 80, 20)];
    _titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:_titleLabel];
}

@end
