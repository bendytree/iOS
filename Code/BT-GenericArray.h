#if BT_BASICS

//
//  BT-GenericArray.h
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/14/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>


#define GENERIC_ARRAY_INTERFACE(classname) \
\
@interface classname ## Array : NSMutableArray \
\
- (NSMutableArray*) add:(classname*)obj;\
- (NSMutableArray*) push:(classname*)obj;\
- (classname*) pop;\
- (classname*) get:(int)i;\
- (classname*) getOrNil:(int)i;\
- (classname*) get:(int)index or:(classname*)_default;\
- (NSArray*) genericTypes;\
\
@end\

#define GENERIC_ARRAY_IMPLEMENTATION(classname) \
@implementation classname ## Array\
\
\
- (NSMutableArray*) add:(classname*)obj\
{\
[self addObject:obj];\
return self;\
}\
\
- (NSMutableArray*) push:(classname*)obj\
{\
[self addObject:obj];\
return self;\
}\
\
- (classname*) pop\
{\
if([self count] > 0){\
classname* obj = (classname*)[self objectAtIndex:[self count]-1];\
[[obj retain] autorelease];\
[self removeObjectAtIndex:[self count]-1];\
return obj;\
}\
return nil;\
}\
\
- (classname*) get:(int)index\
{\
return [self objectAtIndex:index];\
}\
\
- (classname*) getOrNil:(int)index\
{\
if(index >= [self count]) return nil;\
return [self objectAtIndex:index];\
}\
\
- (classname*) get:(int)index or:(classname*)_default\
{\
if(index >= [self count]) return _default;\
return [self objectAtIndex:index];\
}\
\
- (NSArray*) genericTypes\
{\
return [NSArray arrayWithObject:[classname class]];\
}\
\
@end\


GENERIC_ARRAY_INTERFACE(NSString)
GENERIC_ARRAY_INTERFACE(NSNumber)

#endif