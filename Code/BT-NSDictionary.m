//
//  NSDictionary+_.m
//  BuzzamApp
//
//  Created by Josh Wright on 2/11/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import "BT-NSDictionary.h"

@implementation NSDictionary (BT)

- (id) objectForKeyNotNSNull:(id)key {
    id o = [self objectForKey:key];
    if (o == [NSNull null])
        return nil;
    return o;
}

- (id) valueForKeyNotNSNull:(id)key {
    id o = [self objectForKey:key];
    if (o == [NSNull null])
        return nil;
    return o;
}

@end
