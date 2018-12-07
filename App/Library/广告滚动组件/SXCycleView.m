//
//  SXCycleView.m
//  SafeAreaTest
//
//  Created by muzico on 2018/12/6.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "SXCycleView.h"

#import "SXCellView.h"
#import "SXLinkList.h"

@interface SXCycleView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *mainView;

@property (nonatomic, strong) SXCellView *cellView0;
@property (nonatomic, strong) SXCellView *cellView1;
@property (nonatomic, strong) SXCellView *cellView2;

@property (nonatomic, assign) BOOL isMove;
@property (nonatomic, assign) NSInteger dataCount;
@property (nonatomic, strong) SXLinkList *ptr;
@property (nonatomic, strong) SXLinkList *nowPtr;

//轮播
@property (nonatomic, assign) NSInteger totalItemsCount;
@property (nonatomic, weak) NSTimer *timer;

@end

static NSString *const SXCycleViewImageKey = @"imageKey";
static NSString *const SXCycleViewTitleKey = @"titleKey";

@implementation SXCycleView

#pragma mark-------------------set方法----
- (void)setAutoScroll:(BOOL)autoScroll {
    _autoScroll = autoScroll;
    
    [self invalidateTimer];
    
    if (_autoScroll) {
        [self setupTimer];
    }
}

- (void)setPageControl:(UIPageControl *)pageControl {
    [_pageControl removeFromSuperview];
    _pageControl = nil;
    _pageControl = pageControl;
    _pageControl.numberOfPages = _dataCount;
    _pageControl.userInteractionEnabled = NO;
    _pageControl.currentPage = _ptr.index;
    [self addSubview:_pageControl];
}

- (void)setShowPageControl:(BOOL)showPageControl {
}

#pragma mark-------------------初始化方法----
- (instancetype) init {
    if (self = [super init]) {
        [self setupWithInit];
    }
    return self;
}
- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupWithInit];
    }
    return self;
}
- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupWithInit];
    }
    return self;
}

- (void) setupWithInit {
    [self initData];
}

- (void) didMoveToSuperview {
    [super didMoveToSuperview];
    
    [self createView];
}


- (void) setImages:(NSArray *)images {
    _images = images;
    
    [self setupLinkList];
}

- (void) setTitles:(NSArray *)titles {
    _titles = titles;
    
    [self setupLinkList];
}

- (void) setupLinkList {
    NSMutableArray *keepArray = [NSMutableArray array];
    if ([self.images isKindOfClass:[NSArray class]]) {
        NSInteger index = 0;
        for (id image in self.images) {
            NSMutableDictionary *keepDictionary = [NSMutableDictionary dictionary];
            [keepDictionary setObject:image forKey:SXCycleViewImageKey];
            
            if ([self.titles isKindOfClass:[NSArray class]] && [self.titles count] > index) {
                [keepDictionary setObject:[self.titles objectAtIndex:index] forKey:SXCycleViewTitleKey];
            } else {
                [keepDictionary setObject:@"" forKey:SXCycleViewTitleKey];
            }
            [keepArray addObject:keepDictionary];
            index++;
        }
    }
    _dataCount = keepArray.count;
    _totalItemsCount = keepArray.count;
    _ptr = [SXLinkList createLinkListWithURLsArray:keepArray];
    
    if (self.mainView == nil) {
        return;
    }
    
    [self controlView:_cellView0 data:_ptr.last];
    [self controlView:_cellView1 data:_ptr];
    [self controlView:_cellView2 data:_ptr.next];
    
    [_mainView setContentOffset:CGPointMake(self.bounds.size.width, 0) animated:NO];
    
    _dataCount == 1 ? [_mainView setScrollEnabled:NO] : [self setupTimer];
    _dataCount == 1 ? :[self createPageControl];
}


- (void)initData {
    _isMove = NO;
    _nowPtr = nil;
    _autoScroll = YES;
    _autoScrollTimeInterval = 5.f;
}


- (void) setFrame:(CGRect)frame {
    if (CGRectEqualToRect(self.frame, frame) == YES) {
        return;
    }
    
    [super setFrame:frame];
    
    [self reloadLayout];
}

- (void) reloadLayout {
    self.mainView.frame = self.bounds;
    self.mainView.contentSize = CGSizeMake(self.frame.size.width * 3, self.frame.size.height);
    
    self.cellView0.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.cellView1.frame = CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
    self.cellView2.frame = CGRectMake(self.frame.size.width * 2, 0, self.frame.size.width, self.frame.size.height);
    
    self.pageControl.frame = CGRectMake(self.bounds.size.width - 10 - 60, self.bounds.size.height - 10 - 20, 60, 20);
    
    [_mainView setContentOffset:CGPointMake(self.bounds.size.width * 2, 0) animated:YES];
}
- (void)createView {
    
    if (self.mainView) {
        return;
    }
    
    _mainView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _mainView.contentSize = CGSizeMake(self.frame.size.width * 3, self.frame.size.height);
    _mainView.backgroundColor = [UIColor clearColor];
    _mainView.pagingEnabled = YES;
    _mainView.showsHorizontalScrollIndicator = NO;
    _mainView.showsVerticalScrollIndicator = NO;
    _mainView.delegate = self;
    _mainView.scrollsToTop = NO;
    [self addSubview:_mainView];
    
    _cellView0 = [[SXCellView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self controlView:_cellView0 data:_ptr.last];
    [_mainView addSubview:_cellView0];
    _cellView1 = [[SXCellView alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
    [self controlView:_cellView1 data:_ptr];
    [_mainView addSubview:_cellView1];
    _cellView2 = [[SXCellView alloc] initWithFrame:CGRectMake(self.frame.size.width * 2, 0, self.frame.size.width, self.frame.size.height)];
    [self controlView:_cellView2 data:_ptr.next];
    [_mainView addSubview:_cellView2];
    
    [_mainView setContentOffset:CGPointMake(self.bounds.size.width, 0) animated:NO];
    
    _dataCount == 1 ? [_mainView setScrollEnabled:NO] : [self setupTimer];
    _dataCount == 1 ? :[self createPageControl];
    
    UITapGestureRecognizer * tapAction = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBlockAction)];
    [self addGestureRecognizer:tapAction];
}

- (void)createPageControl {
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(self.bounds.size.width - 10 - 60, self.bounds.size.height - 10 - 20, 60, 20)];
    pageControl.numberOfPages = _dataCount;
    pageControl.userInteractionEnabled = NO;
    pageControl.currentPage = _ptr.index;
    [self addSubview:pageControl];
    _pageControl = pageControl;
}

- (void)controlView:(SXCellView *)cellView data:(SXLinkList *)listPoint {
    if (self.setupCellImageBlock) {
        id imageDataSource = nil;
        if ([listPoint.data isKindOfClass:[NSDictionary class]]) {
            imageDataSource = [listPoint.data objectForKey:SXCycleViewImageKey];
        }
        self.setupCellImageBlock(self, cellView.imageView, imageDataSource);
    }
}

- (void)clickBlockAction {
    if (self.didSelectCellblock) {
        self.didSelectCellblock(self, _ptr.index);
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.x <= 0 || scrollView.contentOffset.x >= 2 * self.bounds.size.width) {
        if (!_isMove) {
            _isMove = YES;
            _nowPtr = _ptr;
        }
        
        if (scrollView.contentOffset.x <= 0) {
            _ptr = _nowPtr.last;
        } else {
            _ptr = _nowPtr.next;
        }
        [self controlView:_cellView0 data:_ptr.last];
        [self controlView:_cellView1 data:_ptr];
        [self controlView:_cellView2 data:_ptr.next];
        
        [scrollView setContentOffset:CGPointMake(self.bounds.size.width, 0) animated:NO]; //切换到下标1的cell
        _isMove = NO;
        _pageControl.currentPage = _ptr.index;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (self.autoScroll) {
        [self invalidateTimer];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (self.autoScroll) {
        [self setupTimer];
    }
}

#pragma mark - actions

- (void)setupTimer {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.autoScrollTimeInterval target:self selector:@selector(automaticScroll) userInfo:nil repeats:YES];
    _timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)automaticScroll {
    if (0 == _totalItemsCount) return;
    [_mainView setContentOffset:CGPointMake(self.bounds.size.width * 2, 0) animated:YES];
}

- (void)invalidateTimer {
    [_timer invalidate];
    _timer = nil;
}

@end
