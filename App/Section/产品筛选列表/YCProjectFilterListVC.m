//
//  YCProjectFilterListVC.m
//  juhao
//
//  Created by muzico on 2018/11/29.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "YCProjectFilterListVC.h"
#import "YCProjectDetailVC.h"




@interface YCProjectFilterListVC ()

@property(nonatomic,strong) CommonFixView *fiexView;



@end

@implementation YCProjectFilterListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.view.lqs_backgroundColor = @"#ededed";
    
    
    NSMutableArray *keepArray = [NSMutableArray array];
    {
        UIView* tempHead = [UIView lqs_backgroundColor:@"R"];
        CommonFixViewItem *item = [CommonFixViewItem new];
        item.view = tempHead;
        item.height = 44;
        [keepArray addObject:item];
    }
    {
        UIView* tempMiddle = [UIView lqs_backgroundColor:@"R"];
        CommonFixViewItem *item = [CommonFixViewItem new];
        item.view = tempMiddle;
        item.height = 44;
        [keepArray addObject:item];
    }
    
    __weak typeof(self) weakSelf = self;
    
    CommonCollectionView *collectionView = [CommonCollectionView new];
    collectionView.column = 2;
    collectionView.cellSizeScale = 1.3;
    collectionView.cellNibString = @"YCNewProductCollectionCell";
    collectionView.collectionDataSource = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    collectionView.didSelectBlock = ^(CommonCollectionView *collectionView, id dataSource, NSIndexPath *indexPath, NSInteger index) {
        
        YCProjectDetailVC *vc = [YCProjectDetailVC new];
        LQSBoxController *boxController = LQSBoxCreate(vc);
        UIViewController *currentVC = [weakSelf lqs_currentViewControllerWithClass:[LQSBoxController class]];
        [currentVC lqs_currentNavigationControllerPushViewController:boxController];
    };
    
    
    
    collectionView.collectionDataSource = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    
    
    
    
    
    
    
    
    CommonFixView *fiexView = [CommonFixView new];
    fiexView.items = keepArray;
    fiexView.otherView = collectionView;
//    [self.view addSubview:fiexView];
    [self lqs_boxControllerWithFillView:fiexView];
    self.fiexView = fiexView;
}


//- (void) lqs_boxControllerWithBoxViewReloadLayout {
//    self.fiexView.frame = self.view.bounds;
//}
@end
