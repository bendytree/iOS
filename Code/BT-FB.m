#if BT_FB

//
//  BT-FB.m
//  BuzzamApp
//
//  Created by Joshua Wright on 9/30/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import "BT-FB.h"
#import "Facebook.h"

@implementation FB

@synthesize facebook;

- (id)init {
    self = [super init];
    if (self) {
        self.facebook = [[[Facebook alloc] initWithAppId:@"242857252432172" andDelegate:nil] autorelease];
    }
    return self;
}



#pragma Singleton

static FB* _current = NULL;
+ (FB*) current
{
    if(_current == NULL){
        _current = [[FB alloc] init];
    }
    return _current;
}

@end

#endif