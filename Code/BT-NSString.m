#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 12/5/10.
//  Copyright 2010 Bendy Tree iOS Library. All rights reserved.
//

#import "BT-NSString.h"


@implementation NSString (BT)

- (bool) contains:(NSString*)subtext
{
    return [self rangeOfString:subtext].length != 0;
}

- (bool) containsIgnoreCase:(NSString*)subtext
{
    return [self rangeOfString:subtext options:NSCaseInsensitiveSearch].length != 0;
}

- (NSString*) replace:(NSString*)target with:(NSString*)replacement
{
    return [self stringByReplacingOccurrencesOfString:target withString:replacement];
}

- (bool) isEqualIgnoreCase:(NSString*)text
{
    return [self caseInsensitiveCompare:text] == NSOrderedSame;
}

- (NSArray*) split:(NSString*)splitter
{
    return [self componentsSeparatedByString:splitter];
}

- (NSString*) format:(id)obj
{
    NSMutableString* format = [NSMutableString string];
    
    BOOL isFirst = YES;
    for(NSString* section in [self split:@"#{"]){
        if(!isFirst && [section contains:@"}"]){
            isFirst = NO;
            NSMutableArray* innerSections = [NSMutableArray arrayWithArray:[section split:@"}"]];
            if([innerSections count] == 0)
                continue;
            NSString* key = [innerSections first];
            NSString* value = [[obj valueForKey:key] description];
            [format appendString:value];
            if([innerSections count] == 1)
                continue;
            [innerSections removeObjectAtIndex:0];
            [format appendString:[innerSections join:@""]];
        }else{
            [format appendString:section];
        }
    }
    
    return format;
}

@end


#endif