#if BT_JSON

//
//  BTSerializer.h
//  BendyTreeiPhoneLibTesting
//
//  Created by JOSHUA WRIGHT on 11/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BTJSON)
- (NSString*) serialize;
@end


@interface NSString (BTJSON)
- (id) deserialize;
- (id) deserialize:(Class)type;
@end


@interface BTSerializer : NSObject

@property (retain) NSArray* AllClasses;

+ (BTSerializer*) current;

- (void) registerClasses:(NSArray*)classes;
- (NSString*) serialize:(id)obj;
- (id) deserialize:(NSString*)json toType:(Class)type;

@end


#endif