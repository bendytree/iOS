#if BT_BASICS

//
//  BT-Image.m
//  SoonerFantasyApp
//
//  Created by Joshua Wright on 9/5/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import "BT-Image.h"

@implementation Image

+ (UIImage*) named:(NSString*)name
{
    return [UIImage imageNamed:name];
}

@end

#endif