#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 12/5/10.
//  Copyright 2010 Bendy Tree iOS Library. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BT)

- (bool) contains:(NSString*)subtext;
- (bool) containsIgnoreCase:(NSString*)subtext;
- (NSString*) replace:(NSString*)target with:(NSString*)replacement;
- (bool) equals:(NSString*)text;
- (NSArray*) split:(NSString*)splitter;
//- (NSString*) format: (id) firstObject, ... NS_REQUIRES_NIL_TERMINATION;
- (NSString*) inject:(id)obj;

@end

#endif