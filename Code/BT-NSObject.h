#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 1/5/11.
//  Copyright 2011 Bendy Tree iOS Library. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (BT)

+ (BOOL)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector;

@end

#endif