//
//  NSString+Awesome.m
//  YourAppHereAppSource
//
//  Created by JOSHUA WRIGHT on 12/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSString+Awesome.h"


@implementation NSString (Awesome)

- (bool) contains:(NSString*)subtext
{
    return [self rangeOfString:subtext].length != 0;
}

- (bool) containsIgnoreCase:(NSString*)subtext
{
    return [self rangeOfString:subtext options:NSCaseInsensitiveSearch].length != 0;
}

- (bool) isEqualIgnoreCase:(NSString*)text
{
    bool result = [self caseInsensitiveCompare:text] == NSOrderedSame;
    return result; //For some reason assignment has to happen, then return or else WebCommand matches everywhere    
}

@end


@implementation NSString (Formatting)

- (NSString*) format:(id)obj
{
    return [StringFormattingService formatString:self withObject:obj];
}

@end


@implementation StringFormattingService

+ (NSString*) formatString:(NSString*)str withObject:(id)obj
{
    NSArray* matches = [str arrayOfCaptureComponentsMatchedByRegex:@"#\\{[^}]*\\}"];
    
    for(NSArray* match in matches){
        NSString* matchStr = [match objectAtIndex:0];
        NSString* key = [matchStr substringWithRange:NSMakeRange(2, [matchStr length]-3)];
        NSString* value = [[obj valueForKey:key] description];
        str = [str stringByReplacingOccurrencesOfString:matchStr withString:value];
    }
    
    return str;
}

@end



