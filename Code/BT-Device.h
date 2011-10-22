#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 1/21/11.
//  Copyright 2011 Bendy Tree iOS Library. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Device : NSObject 

+ (BOOL) isIPad;
+ (bool) isSimulator;
+ (NSString*) udid __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_NA,__MAC_NA,__IPHONE_2_0,__IPHONE_5_0);

@end

#endif