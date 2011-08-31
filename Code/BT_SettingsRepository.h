//
//  SettingsRepository.h
//  BibleAppSource
//
//  Created by JOSHUA WRIGHT on 5/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SettingsRepository : NSObject {

    NSMutableDictionary* dic;
    
}

+ (SettingsRepository*) current;

- (void) set:(id)val forKey:(NSString*)key;
- (bool) hasValue:(NSString*)key;
- (id) get:(NSString*)key;

- (bool) getBool:(NSString*)key;
- (void) setBool:(bool)val forKey:(NSString*)key;

- (NSString*) getString:(NSString*)key orDefault:(NSString*)def;
- (void) setString:(NSString*)val forKey:(NSString*)key;

- (int) getInt:(NSString*)key orDefault:(int)def;
- (void) setInt:(int)val forKey:(NSString*)key;

- (NSArray*) getArray:(NSString*)key orDefault:(NSArray*)array;
- (void) setArray:(NSArray*)array forKey:(NSString*)key;

- (NSData*) getData:(NSString*)key orDefault:(NSData*)data;
- (void) setData:(NSData*)data forKey:(NSString*)key;

@end
