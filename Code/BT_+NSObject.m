//
//  NSObject+Swizzle.m
//  AllStarApps
//
//  Created by JOSHUA WRIGHT on 1/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h> 
#import <objc/message.h>


@implementation NSObject (BT)

+ (BOOL)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector
{
    Method origMethod = class_getInstanceMethod(self, origSelector);
    Method newMethod = class_getInstanceMethod(self, newSelector);
    
    if (origMethod && newMethod) {
        if (class_addMethod(self, origSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
            class_replaceMethod(self, newSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
        } else {
            method_exchangeImplementations(origMethod, newMethod);
        }
        return YES;
    }
    return NO;
}

@end