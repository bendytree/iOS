#if BT_JSON

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 11/22/10.
//  Copyright 2010 Bendy Tree iOS Library. All rights reserved.
//

#import "BT-JSON.h"
#import "JSON.h"
#import "BT-NSArray.h"
#import <objc/runtime.h>
#import "BT-CoreTypeConversion.h"


@implementation NSObject (BTJSON)

- (NSString*) serialize
{
    return [[self toCoreType] JSONRepresentation];
}

@end

@implementation NSString (BTJSON)

- (id) deserialize
{
    return [self JSONValue];
}

- (id) deserialize:(Class)type
{
    id coreType = [self deserialize];
    return [coreType toCustomType:type];
}

@end


#endif
