#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 8/15/09.
//  Copyright 2009 Bendy Tree iOS Library. All rights reserved.
//

#import "BT-Alert.h"


@implementation Alert

static UIAlertView* alert = NULL;
static id delegate = NULL;
static SEL selector = NULL;
static id context = NULL;


+ (void) show:(NSString*)message
{
    [self show:@"" message:message];
}

+ (void) show:(NSString*)title message:(NSString*)msg
{
    [self show:title message:msg delegate:nil selector:nil context:nil];
}

+ (void) show:(NSString*)title message:(NSString*)message delegate:(id)del selector:(SEL)sel
{
    [self show:title message:message delegate:del selector:sel context:nil];
}

+ (void) show:(NSString*)title message:(NSString*)message delegate:(id)del selector:(SEL)sel context:(id)con
{    
    delegate = del;
    selector = sel;
    context = con;
    
    alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    alert.delegate = self;
    [alert show];
}

+ (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [alert autorelease];
    alert = nil;
    
    if(delegate != nil)
        [delegate performSelector:selector withObject:context];
}

@end

#endif