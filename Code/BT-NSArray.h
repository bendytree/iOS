#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 11/22/10.
//  Copyright 2010 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (BT)

- (bool) contains:(id)example;
- (id) first;
- (id) last;
- (NSString*) join:(NSString*)separator;

@end

#endif