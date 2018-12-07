//
//  SXLinkList.m
//  SafeAreaTest
//
//  Created by muzico on 2018/12/6.
//  Copyright © 2018 muzico. All rights reserved.
//

#import "SXLinkList.h"

@implementation SXLinkList

+ (SXLinkList *)createLinkList {
    SXLinkList *head = [[SXLinkList alloc] init];
    head.data = [NSNumber numberWithInt:0];
    SXLinkList *ptr = head;
    for (int i=1; i<10; i++){
        SXLinkList *node = [[SXLinkList alloc] init];
        node.data = [NSNumber numberWithInt:i];
        ptr.next = node;
        node.last = ptr;
        ptr = node;
    }
    head.last = ptr;
    ptr.next = head;
    return head;
}

+ (SXLinkList *)createLinkListWithURLsArray:(NSArray *)urlArr {
    SXLinkList *head = [[SXLinkList alloc] init];
    head.data = [urlArr firstObject];
    head.index = 0;
    SXLinkList *ptr = head;
    for (int i=1; i<urlArr.count; i++){
        SXLinkList *node = [[SXLinkList alloc] init];
        node.index = i;
        node.data = [urlArr objectAtIndex:i];
        ptr.next = node;
        node.last = ptr;
        ptr = node;
    }
    head.last = ptr;
    ptr.next = head;
    return head;
}

@end
