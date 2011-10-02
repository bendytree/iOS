#if BT_FB

//
//  BT-FB.h
//  BuzzamApp
//
//  Created by Joshua Wright on 9/30/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Facebook.h"

@interface FB : NSObject

+ (FB*) current;

@property (retain) Facebook* facebook;

@end

#endif