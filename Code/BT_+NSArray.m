//
//  NSArray+Awesome.m
//  BendyTreeiPhoneLibTesting
//
//  Created by JOSHUA WRIGHT on 11/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSArray+Awesome.h"


@implementation NSArray (Awesome)

- (bool) containsString:(NSString*)str
{
    NSArray* arr = (NSArray*)self;
    for(NSString* el in arr){
        if([el caseInsensitiveCompare:str]){
            return YES;
        }
    }
    return NO;
}

@end
