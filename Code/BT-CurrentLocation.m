#if BT_LOCATION

//
//  BT-Location.m
//  BuzzamApp
//
//  Created by Josh Wright on 2/3/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import "BT-CurrentLocation.h"


@interface CurrentLocation()
@property (retain) CLLocationManager* manager;
@property (assign) BOOL isMonitoring;
@end


@implementation CurrentLocation

@synthesize manager, isMonitoring;

- (id)init {
    self = [super init];
    if (self) {
        
        self.manager = [[CLLocationManager new] autorelease];
        [self.manager setPurpose:@"Segments such as weather are based on your location."];
        self.isMonitoring = NO;
        
    }
    return self;
}

+ (void) start
{
    CurrentLocation* cur = [self current];
    if(cur.isMonitoring) return;
    
    
    [cur.manager startMonitoringSignificantLocationChanges];
    cur.isMonitoring = YES;
    LOG_TO(@"location", @"start monitoring");
}

+ (void) stop
{
    CurrentLocation* cur = [self current];
    if(cur.isMonitoring == NO) return;
    
    [cur.manager stopMonitoringSignificantLocationChanges];
    cur.isMonitoring = NO;
    LOG_TO(@"location", @"stop monitoring");
}

+ (CLLocation*) location
{
    CLLocation* loc = [self current].manager.location;
    if(CLLocationCoordinate2DIsValid(loc.coordinate) == NO)
        return nil;
    return loc;
}

SINGLETON_IMPLEMENTATION(CurrentLocation)

@end

#endif