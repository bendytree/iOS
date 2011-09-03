#if BT_BASICS

//
//  BT-Reflection.h
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/2/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (BT_Reflection)
- (BOOL) descendsFrom:(Class)cls;
- (NSArray*) propertyNames;
- (void) setAllPropertiesToNil;
- (Class) getPropertyType:(NSString*)name;
@end


#endif