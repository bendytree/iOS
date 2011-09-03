#if BT_BASICS

//
//  BT-CoreTypeConversion.m
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/2/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import "BT-CoreTypeConversion.h"


@implementation NSObject (BT_CoreTypeConversion)

- (id) toCoreType
{    
    //Arrays
    if([self descendsFrom:[NSArray class]])
    {
        NSMutableArray* newArray = [NSMutableArray array];
        for(id o in (NSArray*)self){
            [newArray addObject:[o toCoreType]];
        }
        return newArray;
    }        
    
    //Already Core Type
    if(
       [self descendsFrom:[NSString class]]
       || [self descendsFrom:[NSNumber class]]
       || [self descendsFrom:[NSDictionary class]] //this may have custom types for keys :(
       )
    {
        return self;
    }
    
    //Dates
    if([self isKindOfClass:[NSDate class]]){
        NSDate* date = (NSDate*)self;
        return [NSString stringWithFormat:@"/Date(%.f)/", [date timeIntervalSince1970]];
    }
    
    //Custom Type
    NSMutableDictionary* dic = [NSMutableDictionary dictionary];
    for(NSString* propertyName in [self propertyNames]){
        id val = [self valueForKey:propertyName];
        if(val && val != [NSNull null])
        {
            //trim the trailing _ (for well named options such as long)
            if([propertyName characterAtIndex:[propertyName length]-1] == '_')
                propertyName = [propertyName substringToIndex:[propertyName length]-1];
            
            [dic setObject:[val toCoreType] forKey:propertyName];
        }
    }
    return dic;
}

- (id) toCustomType:(Class)cls
{
    //is the original an array?
    if([self descendsFrom:[NSArray class]])
    {
        NSArray* originalArray = (NSArray*)self;
        NSMutableArray* items = [NSMutableArray array];
        for(NSDictionary* originalItem in originalArray){
            [items addObject:[originalItem toCustomType:cls]];
        }
        return items;
    }
    
    //if not an array, ct must be a Dictionary
    if([self descendsFrom:[NSDictionary class]] == NO)
        return nil;
    
    NSDictionary* dic = (NSDictionary*)self;
    id obj = [[[cls alloc] init] autorelease];
    
    NSDictionary* arrayClasses = [NSDictionary dictionary];
    if([obj respondsToSelector:@selector(classesForCollectionProperties)]){
        arrayClasses = [obj performSelector:@selector(classesForCollectionProperties)];
    }
    
    for(NSString* propertyName in [cls propertyNames]){        
        Class propertyType = [cls getPropertyType:propertyName];
        id propertyVal = [dic objectForKey:propertyName];
        Class valType = [propertyVal class];
        if(!propertyVal || [NSNull null] == propertyVal) continue;
        
        //save original value of dicitonary in this specially named property
        if([propertyName isEqualToString:@"orig"])
        {
            [obj setValue:self forKey:@"orig"];
            continue;
        }
        
        //NSLog(@"%@.%@ = '%@'", cls, propertyName, propertyVal);
        
        //Property is a Date, Value is a String
        if([propertyType descendsFrom:[NSDate class]]
           && [valType descendsFrom:[NSString class]]){
            [obj setValue:[propertyVal toDate] forKey:propertyName];
            
            //Arrays
        }else if([propertyType descendsFrom:[NSArray class]]){ 
            //Is a custom type defined?
            if([arrayClasses objectForKey:propertyName]){
                Class arrayClass = [arrayClasses objectForKey:propertyName];
                [obj setValue:[propertyVal toCustomType:arrayClass] forKey:propertyName];
            }else{
                //No custom type, so just assign the array
                [obj setValue:propertyVal forKey:propertyName];
            }
            
        // Same type, so just assign
        }else if([valType descendsFrom:propertyType]){
            [obj setValue:propertyVal forKey:propertyName];
            
        // Convert custom object
        }else if([valType descendsFrom:[NSDictionary class]]){
            [obj setValue:[propertyVal toCustomType:propertyType] forKey:propertyName];
        }
    }
    
    return obj;
}

@end


#endif