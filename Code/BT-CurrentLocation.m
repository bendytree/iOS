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
@end


@implementation CurrentLocation

@synthesize manager;

- (id)init {
    self = [super init];
    if (self) {
        self.manager = [[CLLocationManager new] autorelease];
        [self.manager setDesiredAccuracy:kCLLocationAccuracyKilometer];
        [self.manager setDelegate:self];
    }
    return self;
}

+ (void) search
{
    CurrentLocation* loc = [self current];
    [loc.manager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{

}

+ (CLLocation*) location
{
    return [self current].manager.location;
}

SINGLETON_IMPLEMENTATION(CurrentLocation)

@end

#endif