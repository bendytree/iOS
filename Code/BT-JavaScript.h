#if BT_BASICS

//
//  BT-JavaScript.h
//  BuzzamApp
//
//  Created by Joshua Wright on 10/2/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JavaScript : NSObject

+ (NSString*) runStatement:(NSString*)script;
+ (NSString*) runFunctionBody:(NSString*)script;

@end

#endif