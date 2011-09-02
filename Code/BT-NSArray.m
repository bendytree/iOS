#if BT_BASIC_EXTENSIONS

//
//  NSArray+Awesome.m
//  BendyTreeiPhoneLibTesting
//
//  Created by JOSHUA WRIGHT on 11/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BT-NSArray.h"


@implementation NSArray (BT)

- (bool) contains:(id)example
{
    SEL selector = @selector(isEqual:);
    if([example respondsToSelector:@selector(isEqualIgnoreCase:)])
        selector = @selector(isEqualIgnoreCase:);
    
    NSArray* arr = (NSArray*)self;
    for(NSString* el in arr){
        if([el performSelector:selector withObject:example]){
            return YES;
        }
    }
    return NO;
}

- (id) first
{
    return [self objectAtIndex:0];
}

- (id) last
{
    return [self lastObject];
}

- (NSString*) join:(NSString*)separator
{
    return [self componentsJoinedByString:separator];
}

@end

#endif