#if BT_BASICS

//
//  BT-NSDate.h
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/2/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (BT_NSDate)
- (NSString*) toString:(NSString*)dateFormat;
+ (NSDate*) parse:(NSString*)str;
+ (NSDate*) parse:(NSString*)str format:(NSString*)format;
+ (NSDate*) parseRailsDate:(NSString *)dateString;
- (NSString*) toRelativeString;
- (NSString*) toIso8601;
@end


@interface NSString (BT_NSDate)
- (NSDate*) iso8601ToDate;
- (NSDate*) toDate;
- (NSDate*) toDate:(NSString*)format;
@end

#endif