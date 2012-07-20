#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/2/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Confirm : NSObject
+ (void) show:(NSString*)title okTitle:(NSString*)okTitle ok:(void (^)())ok cancelTitle:(NSString*)cancelTitle cancel:(void (^)())cancel;
+ (void) show:(NSString*)title ok:(void (^)())ok cancel:(void (^)())cancel;
@end

#endif