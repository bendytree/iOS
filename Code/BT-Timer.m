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
@end

@implementation TimerInfo
@synthesize obj, sel, timer;
- (void)dealloc {
    self.obj = nil;
    self.timer = nil;
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
            [t.timer invalidate];
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
    t.timer = [NSTimer scheduledTimerWithTimeInterval:delay target:target selector:selector userInfo:nil repeats:NO];
    
    [[self current].timers addObject:t];
}

SINGLETON_IMPLEMENTATION(Timer)

@end

#endif