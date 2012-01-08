#if BT_BASICS

#pragma GCC diagnostic ignored "-Wincomplete-implementation"

//
//  BT-CustomArray.m
//  Test
//
//  Created by Josh Wright on 1/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BT-CustomArray.h"

@implementation ConcreteMutableArray

@synthesize array;

- (void)dealloc {
    self.array = nil;
    [super dealloc];
}

- (id)init {
    self = [super init];
    if (self) {
        self.array = [NSMutableArray new];
    }
    return self;
}


#pragma Forward Invocations to Array

- (void)forwardInvocation:(NSInvocation *)invocation{
    [invocation invokeWithTarget:self.array];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [NSMutableArray instanceMethodSignatureForSelector:aSelector];
}

- (NSUInteger) count {
    return [self.array count];
}

- (id)objectAtIndex:(NSUInteger)index{
    return [self.array objectAtIndex:index];
}

@end

#endif