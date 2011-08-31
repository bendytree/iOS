//
//  DeviceService.m
//  AllStarApps
//
//  Created by JOSHUA WRIGHT on 1/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DeviceService.h"


@implementation DeviceService

+ (BOOL) isIPad
{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

@end
