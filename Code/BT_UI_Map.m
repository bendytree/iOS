//
//  MapService.m
//  YourAppHereAppSource
//
//  Created by JOSHUA WRIGHT on 12/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MapService.h"


@implementation MapService

+ (void) launchDirectionsFrom:(NSString*)from to:(NSString*)to
{
    UIApplication *app = [UIApplication sharedApplication];  
    NSString* urlString = [NSString stringWithFormat:@"http://maps.google.com/maps?saddr=%@&daddr=%@", from, to];
    NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [app openURL:url];  
}

+ (void) showAddress:(NSString*)address
{
    UIApplication *app = [UIApplication sharedApplication];  
    NSString* urlString = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", address];
    NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [app openURL:url];  
}

@end
