//
//  MapService.h
//  YourAppHereAppSource
//
//  Created by JOSHUA WRIGHT on 12/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MapService : NSObject {

}

+ (void) showAddress:(NSString*)address;
+ (void) launchDirectionsFrom:(NSString*)from to:(NSString*)to;

@end
