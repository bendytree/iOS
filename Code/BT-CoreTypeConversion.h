#if BT_BASICS

//
//  BT-CoreTypeConversion.h
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/2/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BT_CoreTypeConversion)
- (id) toCoreType;
- (id) toCustomType:(Class)cls; //Custom types should be CoreTypeConvertable
@end


@protocol CoreTypeConvertable

//Add this to your custom object for a copy of the original
//@property (retain) NSDictionary* orig;


//Implement this if you have collections with custom types
- (NSDictionary*) classesForCollectionProperties;

/*
- (NSDictionary*) classesForCollectionProperties
{
    return [NSDictionary dictionaryWithObjectsAndKeys:
               [Product class], @"products",
               nil];
}
 */

@end

#endif