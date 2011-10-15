#if BT_BASICS

//
//  BT-FuzzyTime.h
//  BuzzamApp
//
//  Created by Joshua Wright on 10/15/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (BT_FuzzyTime)
- (NSString*) fuzzyTime;
@end

#endif