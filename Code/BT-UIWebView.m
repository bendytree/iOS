#if BT_BASIC_EXTENSIONS

//
//  UIWebView+Awesome.m
//  YourAppHereAppSource
//
//  Created by JOSHUA WRIGHT on 12/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BT-UIWebView.h"


@implementation UIWebView (BT)

- (void) setScrolls:(bool)doScroll
{
    for(UIView* v in self.subviews){
        if([v isKindOfClass:[UIScrollView class]]){
            UIScrollView* sv = (UIScrollView*) v;
            sv.scrollEnabled = doScroll;
            sv.bounces = doScroll;
        }
    }
}

@end

#endif