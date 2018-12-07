//
//  SXLinkList.h
//  SafeAreaTest
//
//  Created by muzico on 2018/12/6.
//  Copyright © 2018 muzico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SXLinkList : NSObject

@property(nonatomic, assign) NSInteger index;
@property(nonatomic, strong) id data;
@property(nonatomic, strong) SXLinkList *next;
@property(nonatomic, strong) SXLinkList *last;

+ (SXLinkList *)createLinkList;

+ (SXLinkList *)createLinkListWithURLsArray:(NSArray *)urlArr;

@end
