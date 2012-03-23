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
    
    if([str length] == 18){
        long long seconds = [[str substringWithRange:NSMakeRange(6, 10)] longLongValue];
        date = [NSDate dateWithTimeIntervalSince1970:seconds]; 
        return date;
    }
    
    if([str length] == 19){
        long long seconds = [[str substringWithRange:NSMakeRange(6, 11)] longLongValue];
        date = [NSDate dateWithTimeIntervalSince1970:seconds]; 
        return date;
    }
    
    [df setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    date = [df dateFromString:str];
    if(date) return date;
    
    [df setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    date = [df dateFromString:str];
    if(date) return date;
    
    return nil;
}

+ (NSDate*) parseRailsDate:(NSString *)dateString 
{
    NSDateFormatter *rfc3339TimestampFormatterWithTimeZone = [[NSDateFormatter alloc] init];
    [rfc3339TimestampFormatterWithTimeZone setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"] autorelease]];
    [rfc3339TimestampFormatterWithTimeZone setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    
    NSDate *theDate = nil;
    NSError *error = nil; 
    if (![rfc3339TimestampFormatterWithTimeZone getObjectValue:&theDate forString:dateString range:nil error:&error]) {
        NSLog(@"Date '%@' could not be parsed: %@", dateString, error);
    }
    
    [rfc3339TimestampFormatterWithTimeZone release];
    return theDate;
}

- (NSString*) toRelativeString
{
    NSTimeInterval seconds = [self timeIntervalSinceNow] * -1.0;
    
    if (seconds < 60)
        return @"just now";
    if (seconds < 2*60)
        return @"a minute ago";
    if (seconds < 60*60)
        return [NSString stringWithFormat:@"%i minutes ago", (int)floorf(seconds/60)];
    if (seconds < 2*60*60)
        return @"an hour ago";
    if (seconds < 24*60*60)
        return [NSString stringWithFormat:@"%i hours ago", (int)floorf(seconds/(60*60))];
    if (seconds < 2*24*60*60)
        return @"a day ago";
    if (seconds < 7*24*60*60)
        return [NSString stringWithFormat:@"%i days ago", (int)floorf(seconds/(24*60*60))];
    if (seconds < 2*7*24*60*60)
        return @"a week ago";
    if (seconds < 30*24*60*60)
        return [NSString stringWithFormat:@"%i weeks ago", (int)floorf(seconds/(7*24*60*60))];
    if (seconds < 2*30*24*60*60)
        return @"a month ago";
    if (seconds < 12*30*24*60*60)
        return [NSString stringWithFormat:@"%i months ago", (int)floorf(seconds/(30*24*60*60))];
    if (seconds < 2*365*24*60*60)
        return @"a year ago";
    return [NSString stringWithFormat:@"%i years ago", (int)floorf(seconds/(365*24*60*60))];
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