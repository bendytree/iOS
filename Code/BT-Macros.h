#if BT_BASICS

//
//  BT-Macros.h
//  BuzzamApp
//
//  Created by Josh Wright on 1/19/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//


#define SINGLETON_INTERFACE(classname)\
+ (classname*) current;


#define SINGLETON(classname) \
static classname* _current = NULL;\
+ (classname*) current\
{\
    if(_current == NULL){\
        _current = [[classname alloc] init];\
    }\
    return _current;\
}


#endif