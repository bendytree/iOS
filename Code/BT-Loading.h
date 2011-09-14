#if BT_BASICS

//
//  BT-Loading.h
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/3/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Loading : NSObject

+ (void) show;
+ (void) show:(NSString*)msg;
+ (void) showOn:(UIView*)parentView;
+ (void) show:(NSString*)msg on:(UIView*)parentView;

+ (void) hide;

@end

#endif