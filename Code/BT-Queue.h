//
//  BT-Queue.h
//  BuzzamApp
//
//  Created by Josh Wright on 6/5/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject

@property (assign) dispatch_queue_t q;

- (void) run:(dispatch_block_t)block;
- (void) after:(NSTimeInterval)seconds run:(dispatch_block_t)block;

+ (Queue*) build;
+ (Queue*) queue;
+ (void) main:(dispatch_block_t)block;
+ (void) wait:(NSTimeInterval)seconds then:(dispatch_block_t)block;

@end
