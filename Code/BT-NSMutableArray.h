#if BT_BASIC_EXTENSIONS

//
//  NSMutableArray.h
//  YourAppHereAppSource
//
//  Created by JOSHUA WRIGHT on 10/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (BT)

- (void)moveObjectFromIndex:(NSUInteger)from toIndex:(NSUInteger)to;

@end

#endif