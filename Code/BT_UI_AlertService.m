//
//  AlertService.m
//  GoogleVoiceTwo
//
//  Created by JOSHUA WRIGHT on 8/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AlertService.h"


@implementation AlertService


+ (void) show:(NSString*)title withMessage:(NSString*)message
{
    UIAlertView *someError = [[UIAlertView alloc] initWithTitle: title message:message delegate:nil cancelButtonTitle: @"Ok" otherButtonTitles: nil];
    [someError show];
    [someError release];
}


+ (void) show:(NSString*)message
{
    UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"" message:message delegate:nil cancelButtonTitle: @"Ok" otherButtonTitles: nil];
    [someError show];
    [someError release];
}


@end
