#if BT_LOCATION

//
//  BT-ZipCode.m
//  BuzzamApp
//
//  Created by Joshua Wright on 10/22/11.
//  Copyright (c) 2011 Bendy Tree. All rights reserved.
//

#import "BT-ZipCodeFinder.h"

@interface ZipCodeFinder()
@property (retain) CLLocationManager* manager;
@property (retain) MKReverseGeocoder* geocoder;
@end

@implementation ZipCodeFinder

@synthesize delegate, manager, geocoder;

- (id) initWithDelegate:(id<ZipCodeFinderDelegate>)_delegate {
    self = [super init];
    if (self) {
        self.delegate = _delegate;
    }
    return self;
}

- (void) find
{
    if([NSThread isMainThread] == NO){
        [self performSelectorOnMainThread:@selector(find) withObject:nil waitUntilDone:NO];
        return;
    }
    
    self.manager = [[[CLLocationManager alloc] init] autorelease];
    self.manager.delegate = self;
    [self.manager startUpdatingLocation];
}

- (void)dealloc {
    self.manager.delegate = nil;
    self.geocoder.delegate = nil;
    
    [self setAllPropertiesToNil];
    
    [super dealloc];
}

- (void) stopLocationSearch
{
    self.manager.delegate = nil;
    [self.manager stopUpdatingLocation];
    self.manager = nil;
}

- (void)locationManager:(CLLocationManager *)mgr didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [self stopLocationSearch];
    
    self.geocoder = [[[MKReverseGeocoder alloc] initWithCoordinate: [newLocation coordinate]] autorelease];
    self.geocoder.delegate = self;
    [self.geocoder start];
}

- (void)locationManager:(CLLocationManager *)mgr didFailWithError:(NSError *)error{
    [self stopLocationSearch];
    
    [self.delegate zipCodeSearchComplete:nil];
    
    /*
    CLError code = (CLError)[error code];
    
    if(code == kCLErrorLocationUnknown){   // location is currently unknown, but CL will keep trying
        
	}else if(code == kCLErrorDenied){                 // CL access has been denied (eg, user declined location use)
        
    }else if(code == kCLErrorNetwork){                // general, network-related error
        
    }else if(code == kCLErrorHeadingFailure){          // heading could not be determined
        
    }
     */
}

- (void) stopGeocodeSearch
{
    self.geocoder.delegate = nil;
    self.geocoder = nil;
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)plc
{    
    [self stopGeocodeSearch];
    
    [self.delegate zipCodeSearchComplete:[plc postalCode]];  
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error
{
    [self stopGeocodeSearch];
    
    [self.delegate zipCodeSearchComplete:nil];
}

@end

#endif