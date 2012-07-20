#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 8/15/09.
//  Copyright 2009 Bendy Tree iOS Library. All rights reserved.
//

#import "BT-Alert.h"
#import <objc/runtime.h>

@implementation Alert


+ (void) show:(NSString*)message
{
    [self show:@"" message:message];
}

+ (void) show:(NSString*)title message:(NSString*)msg
{
    [self show:title message:msg then:^{}];
}

+ (void) show:(NSString*)title message:(NSString*)msg then:(void (^)())block
{
    dispatch_async(dispatch_get_main_queue(), ^{ 
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [[self active] addObject:alert];
        
        objc_setAssociatedObject(alert, "blockCallback", Block_copy(block), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [alert show];
    });
}

+ (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [[self active] removeObject:alertView];
    
    void (^block)() = objc_getAssociatedObject(alertView, "blockCallback");
    block();
    Block_release(block);
    objc_removeAssociatedObjects(alertView);
    [alertView release];
}


static NSMutableArray* _active = nil;

+ (NSMutableArray*) active
{
    if(_active == nil)
    {
        _active = [[NSMutableArray alloc] init];
    }
    return _active;
}

@end

#endif