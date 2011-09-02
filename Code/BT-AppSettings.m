#if BT_BASIC_EXTENSIONS

#import "BT-AppSettings.h"


@interface AppSettings()
+ (void) save;
+ (NSMutableDictionary*) dic;
@end



@implementation AppSettings

+ (void) set:(id)val forKey:(NSString*)key
{
    [self.dic setObject:val forKey:key];
    [self save];
}

+ (bool) hasValue:(NSString*)key
{
    return [self.dic objectForKey: key] != nil;
}

+ (id) get:(NSString*)key
{
    return [self.dic objectForKey: key];
}

+ (void) clearKey:(NSString*)key
{
    [self.dic removeObjectForKey:key];
    [self save];
}

+ (NSString*) getString:(NSString*)key orDefault:(NSString*)def
{
    if(![self hasValue:key])
        return def;
    
    return [self.dic objectForKey: key];
}

+ (void) setString:(NSString*)val forKey:(NSString*)key
{
    [self.dic setObject:val forKey:key];
    [self save];
}

+ (bool) getBool:(NSString*)key
{
    return [self hasValue:key] && [((NSNumber*)[self get:key]) boolValue];
}

+ (void) setBool:(bool)val forKey:(NSString*)key
{
    [self.dic setObject:[NSNumber numberWithBool:val] forKey:key];
    [self save];
}

+ (int) getInt:(NSString*)key orDefault:(int)def
{
    if(![self hasValue:key])
        return def;
    
    return [((NSNumber*)[self get:key]) intValue];
}

+ (void) setInt:(int)val forKey:(NSString*)key
{
    [self.dic setObject:[NSNumber numberWithInt:val] forKey:key];
    [self save];
}

+ (NSArray*) getArray:(NSString*)key orDefault:(NSArray*)array
{
    if(![self hasValue:key])
        return array;
    
    return [self get:key];
}

+ (void) setArray:(NSArray*)array forKey:(NSString*)key
{
    [self.dic setObject:array forKey:key];
    [self save];
}

+ (NSData*) getData:(NSString*)key orDefault:(NSData*)data
{
    if(![self hasValue:key])
        return data;
    
    return [self get:key];
}

+ (void) setData:(NSData*)data forKey:(NSString*)key
{
    [self.dic setObject:data forKey:key];
    [self save];
}



#pragma Helpers

+ (NSString*) path
{
    return [NSString stringWithFormat:@"%@/Library/Preferences/settings.plist", NSHomeDirectory()];
}

static NSMutableDictionary* _dic = NULL;
+ (NSMutableDictionary*) dic
{
    @synchronized(self)
    {
        if(_dic == NULL)
        {
            NSString* path = [AppSettings path];
            
            _dic = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
            
            if(!_dic || ![_dic objectForKey: @"___dicExists"])
            {
                _dic = [[NSMutableDictionary alloc] init];
                [_dic setObject:[NSNumber numberWithBool:YES] forKey:@"___dicExists"];
                [_dic writeToFile:path atomically:YES];
            }
        }
    }
    return _dic;
}

+ (void) save
{
    [self.dic writeToFile:[self path] atomically:YES];
}

@end

#endif