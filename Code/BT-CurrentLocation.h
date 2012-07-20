#if BT_LOCATION

//
//  BT-CurrentLocation.h
//  BuzzamApp
//
//  Created by Josh Wright on 2/3/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface CurrentLocation : NSObject<CLLocationManagerDelegate>

+ (void) start;
+ (void) stop;
+ (CLLocation*) location;

SINGLETON_INTERFACE(CurrentLocation)

@end

#endif