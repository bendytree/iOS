#if BT_BASIC_EXTENSIONS

//
//  NSString+Awesome.h
//  YourAppHereAppSource
//
//  Created by JOSHUA WRIGHT on 12/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (BT)

- (bool) contains:(NSString*)subtext;
- (bool) containsIgnoreCase:(NSString*)subtext;
- (bool) isEqualIgnoreCase:(NSString*)text;
- (NSArray*) split:(NSString*)splitter;
- (NSString*) format:(id)obj;

@end

#endif