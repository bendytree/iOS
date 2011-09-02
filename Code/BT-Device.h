//
//  DeviceService.h
//  AllStarApps
//
//  Created by JOSHUA WRIGHT on 1/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Device : NSObject 

+ (BOOL) isIPad;
+ (bool) isSimulator;
+ (NSString*) udid;

@end
