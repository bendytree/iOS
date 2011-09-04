#if BT_BASICS

//
//  BT-Loading.m
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/3/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import "BT-Loading.h"
#import "BT-LoadingController.h"

@implementation Loading


static UIView* _loadingView = NULL;
+ (UIView*) loadingView
{
    if(_loadingView == NULL)
    {
        BT_LoadingController* c = [[[BT_LoadingController alloc] init] autorelease];
        _loadingView = [c.view retain];
    }
    
    return _loadingView;
}

+ (void) show
{
    [self showOn:[[UIApplication sharedApplication] keyWindow]];
}

+ (void) showOn:(UIView*)parentView
{
    UIView* v = [self loadingView];
    [parentView addSubview:v];
    [v setFrame:parentView.frame];
}

+ (void) hide
{
    [[self loadingView] removeFromSuperview];
}

@end

#endif