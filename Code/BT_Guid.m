//
//  GuidService.m
//  YourAppHereAppSource
//
//  Created by JOSHUA WRIGHT on 11/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GuidService.h"


@implementation GuidService

+ (NSString *) generate
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return [(NSString *)string autorelease];
}


@end
