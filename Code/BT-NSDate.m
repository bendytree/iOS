#if BT_BASICS

//
//  BT-NSDate.m
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/2/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import "BT-NSDate.h"

@implementation NSDate (BT_NSDate)

static NSDateFormatter* _formatter = NULL;
+ (NSDateFormatter*) formatter
{
    @synchronized(self)
    {
        if(_formatter == NULL)
            _formatter = [[NSDateFormatter alloc] init];
    }
    return _formatter;
}

- (NSString*) toString:(NSString*)dateFormat
{
    NSDateFormatter* df = [NSDate formatter];
    [df setDateFormat:dateFormat];
    return [df stringFromDate:self];
}

+ (NSDate*) parse:(NSString*)str
{
    return [NSDate parse:str];
}

+ (NSDate*) parse:(NSString*)str format:(NSString*)format
{
    NSDateFormatter* df = [NSDate formatter];
    NSDate* date = nil;
    
    if(format){
        [df setDateFormat:format];
        date = [df dateFromString:str];
        if(date) return date;
    }
    
    [df setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    date = [df dateFromString:str];
    if(date) return date;
    
    [df setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    date = [df dateFromString:str];
    if(date) return date;
    
    return nil;
}

@end


@implementation NSString (BT_NSDate)

- (NSDate*) toDate:(NSString*)format
{
    return [NSDate parse:self format:format];
}

- (NSDate*) toDate
{
    return [NSDate parse:self format:nil];
}

@end


#endif