#if BT_BASIC_EXTENSIONS

//
//  NSMutableArray.m
//  YourAppHereAppSource
//
//  Created by JOSHUA WRIGHT on 10/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BT-NSMutableArray.h"

@implementation NSMutableArray (BT)

- (void)moveObjectFromIndex:(NSUInteger)from toIndex:(NSUInteger)to
{
    if (to != from) {
        id obj = [self objectAtIndex:from];
        [obj retain];
        [self removeObjectAtIndex:from];
        if (to >= [self count]) {
            [self addObject:obj];
        } else {
            [self insertObject:obj atIndex:to];
        }
        [obj release];
    }
}

@end

#endif