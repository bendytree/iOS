//
//  BT-Crash.h
//  BuzzamApp
//
//  Created by Josh Wright on 3/3/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "BT-Macros.h"

@interface Crash : NSObject
@property (retain) NSString* message;
@property (retain) NSArray* callstack;
@property (assign) int signal;
@property (retain) NSString* signalName;
@property (retain) NSException* exception;
- (NSString*) details;
@end


@protocol CrashHandlerDelegate
- (void) onCrash:(Crash*)crash;
@end


@interface CrashHandler : NSObject
+ (void) setDelegate:(id)delegate;
@end

