#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/2/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import "BT-Confirm.h"
#import <objc/runtime.h>

@implementation Confirm : NSObject

+ (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSArray* context = objc_getAssociatedObject(alertView, "confirmContext");
    void (^block)() = [context objectAtIndex:buttonIndex];
    block();

    for(id b in context)
        Block_release(b);

    objc_removeAssociatedObjects(alertView);
    [alertView release];
}

+ (void) show:(NSString*)title okTitle:(NSString*)okTitle ok:(void (^)())ok cancelTitle:(NSString*)cancelTitle cancel:(void (^)())cancel
{        
    dispatch_async(dispatch_get_main_queue(), ^{ 
        
        UIAlertView* prompt = [[UIAlertView alloc] initWithTitle:@"" message:title delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:okTitle, nil];
        
        NSDictionary* context = [NSArray arrayWithObjects:Block_copy(cancel), Block_copy(ok), nil];
        
        objc_setAssociatedObject(prompt, "confirmContext", context, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [prompt show];

    });}

+ (void) show:(NSString*)title ok:(void (^)())ok cancel:(void (^)())cancel
{    
    [self show:title okTitle:@"OK" ok:ok cancelTitle:@"Cancel" cancel:cancel];
}


@end


#endif