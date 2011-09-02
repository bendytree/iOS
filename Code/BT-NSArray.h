#if BT_BASIC_EXTENSIONS

//
//  NSArray+Awesome.h
//  BendyTreeiPhoneLibTesting
//
//  Created by JOSHUA WRIGHT on 11/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (BT)

- (bool) contains:(id)example;
- (id) first;
- (id) last;
- (NSString*) join:(NSString*)separator;

@end

#endif