//
//  BT-FuzzyTime.m
//  BuzzamApp
//
//  Created by Joshua Wright on 10/15/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import "BT-FuzzyTime.h"

@implementation NSDate (BT_FuzzyTime)

- (NSString *) fuzzyTime
{
    NSTimeInterval totalSeconds = [self timeIntervalSinceNow] * -1;
    
    int years = totalSeconds/(60*60*24*365);
    totalSeconds -= years * 60*60*24*365;
    int months = totalSeconds/(60*60*24*31);
    totalSeconds -= months * 60*60*24*31;
    int weeks = totalSeconds/(60*60*24*7);
    totalSeconds -= weeks * 60*60*24*7;
    int days = totalSeconds/(60*60*24);
    totalSeconds -= days * 60*60*24;
    int hours = totalSeconds/(60*60);
    totalSeconds -= hours * 60*60;
    int minutes = totalSeconds/60;
    totalSeconds -= minutes * 60;

    if(years > 1){
        return [NSString stringWithFormat:@"over %i years ago", years];
    }else if(years == 1){
        return @"over a year ago";
    }else if(months > 1){
        return [NSString stringWithFormat:@"over %i months ago", months];
    }else if(months == 1){
        return @"over a month ago";
    }else if(weeks > 1){
        return [NSString stringWithFormat:@"over %i weeks ago", weeks];
    }else if(weeks == 1){
        return @"a week ago";
    }else if(days > 1){
        return [NSString stringWithFormat:@"%i days ago", days];
    }else if(days == 1){
        return @"a day ago";
    }else if(hours > 1){
        return [NSString stringWithFormat:@"%i hours ago", hours];
    }else if(hours == 1){
        return @"an hour ago";
    }else if(minutes > 1){
        return [NSString stringWithFormat:@"%i minutes ago", minutes];
    }else if(minutes == 1){
        return @"a minute ago";
    }
    
    return @"just now";
}

@end
