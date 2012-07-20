//
//  BT-Queue.m
//  BuzzamApp
//
//  Created by Josh Wright on 6/5/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import "BT-Queue.h"

@implementation Queue

@synthesize q;

static int instanceCount = 0;

- (id)init
{
    self = [super init];
    if (self) {
        
        instanceCount += 1;
        NSString* name = [NSString stringWithFormat:@"am.buzz.queue.%i", instanceCount];
        self.q = dispatch_queue_create([name cStringUsingEncoding:[NSString defaultCStringEncoding]], NULL);
        
    }
    return self;
}

- (void)dealloc
{
    dispatch_release(self.q);
    self.q = nil;
    
    [super dealloc];
}

+ (Queue*) queue
{
    return [[[Queue alloc] init] autorelease];
}

+ (Queue*) build
{
    return [self queue];
}

+ (void) main:(dispatch_block_t)block
{
    dispatch_async(dispatch_get_main_queue(), block);
}

- (void) run:(dispatch_block_t)block {
    dispatch_async(self.q, block);
}

- (void) after:(NSTimeInterval)seconds run:(dispatch_block_t)block
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC), self.q, block);
}

+ (void) wait:(NSTimeInterval)seconds then:(dispatch_block_t)block
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC), dispatch_get_current_queue(), block);
}

@end
