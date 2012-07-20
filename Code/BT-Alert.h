#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 8/15/09.
//  Copyright 2009 Bendy Tree iOS Library. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Alert : NSObject

+ (void) show:(NSString*)message;
+ (void) show:(NSString*)title message:(NSString*)msg;
+ (void) show:(NSString*)title message:(NSString*)msg then:(void (^)())block;
+ (NSMutableArray*) active;

@end

#endif