#if BT_BASICS

//
//  BT-Callback.m
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/4/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import "BT-Callback.h"

@implementation Callback

- (id) initWithDelegate:(id)_delegate selector:(SEL)_selector
{
    self = [super init];
    if (self != nil) {
        delegate = _delegate;
        selector = _selector;
    }
    return self;
}

- (void) call
{
    [delegate performSelector:selector];
}

- (void) callWith:(id)arg
{
    [delegate performSelector:selector withObject:arg];
}

@end


@implementation NSObject (BT_Call)

- (Callback*) callback:(SEL)_selector
{
    return [[[Callback alloc] initWithDelegate:self selector:_selector] autorelease];
}

@end


#endif