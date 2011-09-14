#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/2/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import "BT-Confirm.h"

@implementation Confirm : NSObject

static id delegate = NULL;
static SEL selector = NULL;
static id context = NULL;

+ (void) show:(NSString*)title delegate:(id)del selector:(SEL)sel
{
    [Confirm show:title delegate:del selector:sel context:nil];
}

+ (void) show:(NSString*)title delegate:(id)del selector:(SEL)sel context:(id)con
{
    delegate = del;
    selector = sel;
    context = con;
    
    UIAlertView* prompt = [[[UIAlertView alloc] initWithTitle:@"" message:title delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil] autorelease];
    [prompt show];
}

+ (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    BOOL hasBoolArgument = [NSStringFromSelector(selector) contains:@":"];
    BOOL isConfirmed = buttonIndex == 1;
    
    if(isConfirmed || hasBoolArgument){
        [delegate performSelector:selector withObject:[NSNumber numberWithBool:isConfirmed] withObject:context];
    }
}

@end


#endif