#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 12/12/10.
//  Copyright 2010 Bendy Tree iOS Library. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Links : NSObject

+ (void) launchMapOfAddress:(NSString*)address;
+ (void) launchDirectionsFrom:(NSString*)from to:(NSString*)to;

@end

#endif