//
//  NSDictionary+_.h
//  BuzzamApp
//
//  Created by Josh Wright on 2/11/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BT-NSDictionary.h"

@interface NSDictionary (BT)

- (id) objectForKeyNotNSNull:(id)key;
- (id) valueForKeyNotNSNull:(id)key;

@end
