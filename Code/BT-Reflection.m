#if BT_BASICS

//
//  BT-Reflection.m
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/2/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import "BT-Reflection.h"
#import <objc/runtime.h>
#import "BT-NSDate.h"


@implementation NSObject (BT_Reflection)

- (BOOL) descendsFrom:(Class)classB
{
    //calling 'class' gets class from obj or just return self if already a class struct
    Class classA = [self class];
    while(1)
    {
        if(classA == classB) return YES;
        id superClass = class_getSuperclass(classA);
        if(classA == superClass) return (superClass == classB);
        classA = superClass;
    }
}

- (NSArray*) propertyNames
{
    Class cls = [self class];
    NSMutableArray* names = [NSMutableArray array];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(cls, &outCount);
    for(i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if(propName) {
            NSString *propertyName = [NSString stringWithCString:propName encoding:NSASCIIStringEncoding];
            [names addObject:propertyName];
        }
    }
    free(properties);   
    return names;
}

- (void) setAllPropertiesToNil
{
    for(NSString* propertyName in [self propertyNames]){
        [self setValue:nil forKey:propertyName];
    }
}

- (Class) getPropertyType:(NSString*)name
{
    Class class = [self class];
    objc_property_t property = class_getProperty(class, [name UTF8String]);
    if (property == NULL)
        return nil;
    
    NSString* attributes = [NSString stringWithCString:property_getAttributes(property) encoding:NSASCIIStringEncoding];
    NSString* attribute = [[[attributes componentsSeparatedByString:@","] objectAtIndex:0] substringFromIndex:1];
    
    if([attribute length] > 3)
    {
        NSString* typeName = [attribute substringWithRange:NSMakeRange(2, [attribute length] - 3)];
        Class cls = NSClassFromString(typeName);
        return cls;
    }
    
    return [NSNumber class];
}

@end




#endif