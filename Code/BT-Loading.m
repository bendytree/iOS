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
    [self show:nil];
}

+ (void) show:(NSString*)msg
{
    [self show:msg on:nil];
}

+ (void) showOn:(UIView*)parentView
{
    [self show:nil on:parentView];
}

+ (void) show:(NSString*)msg on:(UIView*)parentView
{
    if(parentView == nil)
        parentView = [[UIApplication sharedApplication] keyWindow];
    
    if(msg == nil)
        msg = @"loading";
    
    UIView* v = [self loadingView];
    [parentView addSubview:v];
    [v setFrame:parentView.frame];
    
    UILabel* lbl = (UILabel*)[v viewWithTag:99];
    lbl.text = msg;
}

+ (void) hide
{
    [[self loadingView] removeFromSuperview];
}

@end

#endif