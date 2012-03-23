#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 12/4/10.
//  Copyright 2010 Bendy Tree iOS Library. All rights reserved.
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

- (void) hideShadows
{
    for(UIView *wview in [[[self subviews] objectAtIndex:0] subviews]) { 
        if([wview isKindOfClass:[UIImageView class]]) { wview.hidden = YES; } 
    } 
}

@end

#endif