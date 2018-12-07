//
//  SXCycleView.h
//  SafeAreaTest
//
//  Created by muzico on 2018/12/6.
//  Copyright © 2018 muzico. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SXCycleView;

typedef void (^SXCycleViewClickedImageBlock)(SXCycleView *cycleView, NSInteger currentIndex);

typedef void(^SXCycleViewSetupCellImageBlock)(SXCycleView *cycleView, UIImageView *imageView, id image);

@interface SXCycleView : UIView

@property (nonatomic, assign) BOOL autoScroll;                //是否自动滚动,默认Yes
@property (nonatomic, assign) CGFloat autoScrollTimeInterval; //自动滚动间隔时间,默认5s


@property(nonatomic,strong) NSArray *images;
@property(nonatomic,strong) NSArray *titles;

/**
 开放的 pageControl
 ! 可以set一个新的pageControl以替换
 ! 亦可简单重设frame
 ! 设置为nil即不显示
 */
@property (nonatomic, weak) UIPageControl *pageControl;

@property (nonatomic, copy) SXCycleViewClickedImageBlock didSelectCellblock;

@property (nonatomic, copy) SXCycleViewSetupCellImageBlock setupCellImageBlock;

@end
