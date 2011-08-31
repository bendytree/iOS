//
//  SettingsRepository.mm
//  PocketTap
//
//  Created by JOSHUA WRIGHT on 2/27/10.
//  Copyright 2010 Bendy Tree. All rights reserved.
//

#import "SettingsRepository.h"


@implementation SettingsRepository


+ (bool) isSimulator
{
#if TARGET_IPHONE_SIMULATOR
    return true;
#else
    return false;
#endif   
}

+ (NSString*) udid
{
    return [UIDevice currentDevice].uniqueIdentifier;   
}

- (NSString*) pathToDic
{
    return [NSString stringWithFormat:@"%@/Library/Preferences/settings.plist", NSHomeDirectory()];
}

- (void) saveDic
{
    [dic writeToFile:[self pathToDic] atomically:YES];
}

- (void) makeSureDicExists
{
    dic = [[NSMutableDictionary alloc] initWithContentsOfFile:[self pathToDic]];
    if(!dic || ![dic objectForKey: @"___dicExists"])
    {
        dic = [[NSMutableDictionary alloc] init];
        [dic setObject:[NSNumber numberWithBool:YES] forKey:@"___dicExists"];
        [self saveDic];
    }
}

- (void) set:(id)val forKey:(NSString*)key
{
    [dic setObject:val forKey:key];
    [self saveDic];
}

- (bool) hasValue:(NSString*)key
{
    return [dic objectForKey: key] != nil;
}

- (id) get:(NSString*)key
{
    return [dic objectForKey: key];
}



- (NSString*) getString:(NSString*)key orDefault:(NSString*)def
{
    if(![self hasValue:key])
        return def;
    
    return [dic objectForKey: key];
}

- (void) setString:(NSString*)val forKey:(NSString*)key
{
    [dic setObject:val forKey:key];
    [self saveDic];
}



- (bool) getBool:(NSString*)key
{
    return [self hasValue:key] && [((NSNumber*)[self get:key]) boolValue];
}

- (void) setBool:(bool)val forKey:(NSString*)key
{
    [dic setObject:[NSNumber numberWithBool:val] forKey:key];
    [self saveDic];
}




- (int) getInt:(NSString*)key orDefault:(int)def
{
    if(![self hasValue:key])
        return def;
    
    return [((NSNumber*)[self get:key]) intValue];
}

- (void) setInt:(int)val forKey:(NSString*)key
{
    [dic setObject:[NSNumber numberWithInt:val] forKey:key];
    [self saveDic];
}



- (NSArray*) getArray:(NSString*)key orDefault:(NSArray*)array
{
    if(![self hasValue:key])
        return array;
    
    return [self get:key];
}

- (void) setArray:(NSArray*)array forKey:(NSString*)key
{
    [dic setObject:array forKey:key];
    [self saveDic];
}

- (NSData*) getData:(NSString*)key orDefault:(NSData*)data
{
    if(![self hasValue:key])
        return data;
    
    return [self get:key];
}

- (void) setData:(NSData*)data forKey:(NSString*)key
{
    [dic setObject:data forKey:key];
    [self saveDic];
}


- (id) init
{
    self = [super init];
    if (self != nil) {
        [self makeSureDicExists];
    }
    return self;
}

// Singleton
static SettingsRepository* _current = NULL;
+ (SettingsRepository*) current
{
    @synchronized(self)
    {
        if(_current == NULL)
            _current = [[self alloc] init];
    }
    return _current;
}



@end
