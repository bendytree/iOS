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
- (bool) containsIgnoreCase:(NSString*)example;
- (bool) containsNumber:(NSNumber*)num;
- (id) firstOrNil;
- (id) first;
- (NSMutableArray*) first:(int)count;
- (NSMutableArray*) skip:(int)count;
- (id) last;
- (NSString*) join:(NSString*)separator;

@end


@interface NSSet (BT_NSArray)

- (NSArray*) toArray;

@end


@interface NSObject (BT_NSArray)

- (NSArray*) toArray;

@end

#endif


