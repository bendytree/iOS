//
//  Wait.m
//  BuzzamApp
//
//  Created by Josh Wright on 6/5/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import "BT-Wait.h"

@implementation Wait

+ (void) seconds:(NSTimeInterval)seconds
{
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:seconds]]; 
}

@end
