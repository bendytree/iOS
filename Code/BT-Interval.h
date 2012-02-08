#if BT_BASICS

//
//  BT-Interval.h
//  BuzzamApp
//
//  Created by Josh Wright on 1/31/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Interval : NSObject

+ (void) schedule:(SEL)selector on:(id)target every:(NSTimeInterval)delay;
+ (void) cancel:(SEL)selector on:(id)target;

SINGLETON_INTERFACE(Interval)

@end

#endif