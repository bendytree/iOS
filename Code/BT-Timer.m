#if BT_BASICS

//
//  Timer.m
//  BuzzamApp
//
//  Created by Josh Wright on 1/29/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import "BT-Timer.h"


@interface TimerInfo : NSObject
@property (assign) id obj;
@property (retain) NSString* sel;
@property (retain) NSTimer* timer;
@property (assign) NSTimeInterval every;
@end


@implementation TimerInfo

@synthesize obj, sel, every, timer;

- (void) start
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.every 
                                                  target:self 
                                                selector:@selector(tick) 
                                                userInfo:nil 
                                                 repeats:NO];
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
    self.timer = nil;
    self.obj = nil;
    self.sel = nil;
    [super dealloc];
}

@end



@interface Timer()
@property (retain) NSMutableArray* timers;
@end


@implementation Timer

@synthesize timers;

- (id)init {
    self = [super init];
    if (self) {
        self.timers = [NSMutableArray array];
    }
    return self;
}

+ (void) cancel:(SEL)selector on:(id)target
{
    NSString* sel = NSStringFromSelector(selector);
    for(int i=0; i < [[self current].timers count]; i++)
    {
        TimerInfo* t = [[self current].timers objectAtIndex:i];
        
        if(target == t.obj && [sel isEqualToString:t.sel])
        {
            [t stop];
            [[self current].timers removeObjectAtIndex:i];
            i--;
        }
    }
}

+ (void) schedule:(SEL)selector on:(id)target after:(NSTimeInterval)delay
{
    TimerInfo* t = [[[TimerInfo alloc] init] autorelease];
    t.obj = target;
    t.sel = NSStringFromSelector(selector);
    t.every = delay;
    
    [[self current].timers addObject:t];
    
    [t start];
}

SINGLETON_IMPLEMENTATION(Timer)

@end

#endif