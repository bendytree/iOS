#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 8/15/09.
//  Copyright 2009 Bendy Tree iOS Library. All rights reserved.
//

#import "BT-Alert.h"


@implementation Alert


+ (void) show:(NSString*)title message:(NSString*)msg
{
    UIAlertView *someError = [[UIAlertView alloc] initWithTitle: title message:msg delegate:nil cancelButtonTitle: @"Ok" otherButtonTitles: nil];
    [someError show];
    [someError release];
}


+ (void) show:(NSString*)message
{
    [self show:@"" message:message];
}


@end

#endif