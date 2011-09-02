#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 1/21/11.
//  Copyright 2011 Bendy Tree iOS Library. All rights reserved.
//

#import "BT-Device.h"


@implementation Device

+ (BOOL) isIPad
{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

+ (bool) isSimulator
{
#if TARGET_IPHONE_SIMULATOR
    return true;
#else
    return false;
#endif   
}

+ (NSString*) udid
{
    return [UIDevice currentDevice].uniqueIdentifier;   
}

@end

#endif