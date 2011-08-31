//
//  UIWebView+Awesome.m
//  YourAppHereAppSource
//
//  Created by JOSHUA WRIGHT on 12/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UIWebView+Awesome.h"


@implementation UIWebView (Awesome)

- (void) setScrolls:(bool)doScroll
{
    UIScrollView* sv = nil;
    for(UIView* v in self.subviews){
        if([v isKindOfClass:[UIScrollView class]]){
            sv = (UIScrollView*) v;
            sv.scrollEnabled = doScroll;
            sv.bounces = doScroll;
        }
    }
}

@end
