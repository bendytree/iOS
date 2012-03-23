//
//  BT-Crash.m
//  BuzzamApp
//
//  Created by Josh Wright on 3/3/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import "BT-CrashHandler.h"
#include <signal.h>
#include <execinfo.h>



@interface CrashHandler()
@property (assign) id delegate;
+ (NSArray*) callstackAsArray;
- (void) handleCrash:(Crash*)crash;
+ (CrashHandler*) current;
@end




void sighandler(int signal)
{
    const char* names[NSIG];
    names[SIGABRT] = "SIGABRT";
    names[SIGBUS] = "SIGBUS";
    names[SIGFPE] = "SIGFPE";
    names[SIGILL] = "SIGILL";
    names[SIGPIPE] = "SIGPIPE";
    names[SIGSEGV] = "SIGSEGV";
    
    NSArray *arr = [CrashHandler callstackAsArray];
    
    Crash* crash = [[[Crash alloc] init] autorelease];
    crash.callstack = arr;
    crash.message = [arr objectAtIndex:6];
    crash.signal = signal;
    crash.signalName = [NSString stringWithUTF8String:names[signal]];
    
    [[CrashHandler current] handleCrash:crash];
}


void uncaughtExceptionHandler(NSException* exception)
{
    NSArray *arr = [CrashHandler callstackAsArray];
    
    Crash* crash = [[[Crash alloc] init] autorelease];
    crash.callstack = arr;
    crash.exception = exception;
    
    [[CrashHandler current] handleCrash:crash];
}



@implementation Crash

@synthesize message, callstack, signal, signalName, exception;

- (void) dealloc
{
    self.message = nil;
    self.callstack = nil;
    self.signal = 0;
    self.signalName = nil;
    self.exception = nil;
    
    [super dealloc];
}

- (NSString*) details
{
    NSMutableString* details = [NSMutableString string];
    
    [details appendFormat:@"Message: %@ \n", self.message];
    
    if(self.exception){
        [details appendFormat:@"Exception Name: %@\n", [self.exception name]];
        [details appendFormat:@"Exception Reason: %@\n", [self.exception reason]];
        [details appendFormat:@"Exception UserInfo: %@\n", [self.exception userInfo]];
        [details appendFormat:@"Exception Stack: %@\n\n", [self.exception callStackSymbols]];
    }else{
        [details appendFormat:@"Signal: %i, %@\n\n", self.signal, self.signalName];
        [details appendFormat:@"Callstack: %@\n", self.callstack];
    }
    
    return details;
}

@end




@implementation CrashHandler

@synthesize delegate;

- (id)init
{
    self = [super init];
    if (self) {
        signal(SIGABRT, sighandler);
        signal(SIGBUS, sighandler);
        signal(SIGFPE, sighandler);
        signal(SIGILL, sighandler);
        signal(SIGPIPE, sighandler);    
        signal(SIGSEGV, sighandler);
        
        NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    }
    return self;
}

- (void)dealloc
{
    signal(SIGABRT, SIG_DFL);
    signal(SIGBUS, SIG_DFL);
    signal(SIGFPE, SIG_DFL);
    signal(SIGILL, SIG_DFL);
    signal(SIGPIPE, SIG_DFL);
    signal(SIGSEGV, SIG_DFL);
    
    NSSetUncaughtExceptionHandler(NULL);
    
    [super dealloc];
}

static CrashHandler* _current = NULL;
+ (CrashHandler*) current
{
    if(_current == NULL){
        _current = [[CrashHandler alloc] init];
    }
    return _current;
}

+ (NSArray*) callstackAsArray
{
    void* callstack[128];
    const int numFrames = backtrace(callstack, 128);
    char **symbols = backtrace_symbols(callstack, numFrames);
    
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:numFrames];
    for (int i = 0; i < numFrames; ++i) 
    {
        [arr addObject:[NSString stringWithUTF8String:symbols[i]]];
    }
    
    free(symbols);
    
    return arr;
}

+ (void) setDelegate:(id)del
{
    [self current].delegate = del;
}

- (void) handleCrash:(Crash*)crash
{
    [self.delegate onCrash:crash];
}

@end





