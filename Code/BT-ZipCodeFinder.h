#if BT_LOCATION

//
//  BT-ZipCode.h
//  BuzzamApp
//
//  Created by Joshua Wright on 10/22/11.
//  Copyright (c) 2011 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@protocol ZipCodeFinderDelegate
- (void) zipCodeSearchComplete:(NSString*)zip;
@end


@interface ZipCodeFinder : NSObject<CLLocationManagerDelegate, MKReverseGeocoderDelegate>

@property (assign) id<ZipCodeFinderDelegate> delegate;

- (id) initWithDelegate:(id<ZipCodeFinderDelegate>)_delegate;

@end

#endif