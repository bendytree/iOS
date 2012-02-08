#if BT_BASICS

//
//  Timer.h
//  BuzzamApp
//
//  Created by Josh Wright on 1/29/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Timer : NSObject

+ (void) schedule:(SEL)selector on:(id)target after:(NSTimeInterval)delay;
+ (void) cancel:(SEL)selector on:(id)target;

SINGLETON_INTERFACE(Timer)

@end

#endif