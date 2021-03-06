#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 11/22/10.
//  Copyright 2010 Bendy Tree iOS Library. All rights reserved.
//

#import "BT-NSArray.h"


@implementation NSArray (BT)

- (bool) contains:(id)example
{
    SEL selector = @selector(isEqual:);
    if([example respondsToSelector:@selector(isEqualIgnoreCase:)])
        selector = @selector(isEqualIgnoreCase:);
    
    NSArray* arr = (NSArray*)self;
    for(NSString* el in arr){
        if([el performSelector:selector withObject:example]){
            return YES;
        }
    }
    return NO;
}

- (bool) containsIgnoreCase:(NSString*)example
{
    for(NSString* el in (NSArray*)self){
        if([el caseInsensitiveCompare:example] == NSOrderedSame){
            return YES;
        }
    }
    return NO;
}

- (bool) containsNumber:(NSNumber*)num
{
    for(NSNumber* el in self)
        return [el compare:num] == NSOrderedSame;
    
    return NO;
}

- (id) first
{
    if([self count] == 0) return nil;
    
    return [self objectAtIndex:0];
}

- (id) firstOrNil
{
    if([self count] == 0) return nil;
    
    return [self objectAtIndex:0];
}

- (NSMutableArray*) first:(int)count
{
    NSMutableArray* items = [NSMutableArray array];
    for(int i=0; i<[self count] && i<count; i++){
        [items addObject:[self objectAtIndex:i]];
    }
    return items;
}

- (NSMutableArray*) skip:(int)count
{
    NSMutableArray* items = [NSMutableArray array];
    for(int i=count; i<[self count]; i++){
        [items addObject:[self objectAtIndex:i]];
    }
    return items;
}

- (id) last
{
    return [self lastObject];
}

- (NSString*) join:(NSString*)separator
{
    return [self componentsJoinedByString:separator];
}

@end


@implementation NSSet (BT_NSArray)

- (NSArray*) toArray
{
    return [self allObjects];
}

@end


@implementation NSObject (BT_NSArray)

- (NSArray*) toArray
{
    return [NSArray arrayWithObject:self];
}

@end

#endif