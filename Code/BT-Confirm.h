#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/2/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Confirm : NSObject
+ (void) show:(NSString*)title delegate:(id)del selector:(SEL)sel;
+ (void) show:(NSString*)title delegate:(id)del selector:(SEL)sel context:(id)con;
@end

#endif