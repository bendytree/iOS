#if BT_BASICS

//
//  BT-Interval.m
//  BuzzamApp
//
//  Created by Josh Wright on 1/31/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import "BT-Interval.h"

@interface IntervalInfo : NSObject
@property (assign) id obj;
@property (retain) NSString* sel;
@property (retain) NSTimer* timer;
@property (assign) NSTimeInterval every;
@end


@implementation IntervalInfo

@synthesize obj, sel, every, timer;

- (void) start
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.every 
                                                  target:self 
                                                selector:@selector(tick) 
                                                userInfo:nil 
                                                 repeats:YES];
}

- (void) stop
{
    [self.timer invalidate];
}

- (void) tick
{
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    
    [self.obj performSelector:NSSelectorFromString(self.sel)];
    
    [pool release];
}

- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
    self.obj = nil;
    self.sel = nil;
    [super dealloc];
}

@end



@interface Interval()
@property (retain) NSMutableArray* intervals;
@end


@implementation Interval

@synthesize intervals;

- (id)init {
    self = [super init];
    if (self) {
        self.intervals = [NSMutableArray array];
    }
    return self;
}

+ (void) cancel:(SEL)selector on:(id)target
{
    NSString* sel = NSStringFromSelector(selector);
    for(int i=0; i < [[self current].intervals count]; i++)
    {
        IntervalInfo* t = [[self current].intervals objectAtIndex:i];
        
        if(target == t.obj && [sel isEqualToString:t.sel])
        {
            [t stop];
            [[self current].intervals removeObjectAtIndex:i];
            i--;
        }
    }
}

+ (void) cancelAll:(id)target
{
    for(int i=0; i < [[self current].intervals count]; i++)
    {
        IntervalInfo* t = [[self current].intervals objectAtIndex:i];
        
        if(target == t.obj)
        {
            [t stop];
            [[self current].intervals removeObjectAtIndex:i];
            i--;
        }
    }
}

+ (void) schedule:(SEL)selector on:(id)target every:(NSTimeInterval)delay
{
    IntervalInfo* t = [[[IntervalInfo alloc] init] autorelease];
    t.obj = target;
    t.sel = NSStringFromSelector(selector);
    t.every = delay;
    
    [[self current].intervals addObject:t];
    
    [t start];
}

SINGLETON_IMPLEMENTATION(Interval)

@end

#endif