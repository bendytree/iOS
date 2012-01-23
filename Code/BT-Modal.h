#if BT_BASICS

//
//  BT-Modal.h
//  BuzzamApp
//
//  Created by Josh Wright on 1/22/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ModalCompletionHandler)();

@interface Modal : NSObject

+ (void) present:(UIViewController*)controller;
+ (void) present:(UIViewController*)controller framed:(BOOL)framed;
+ (void) present:(UIViewController*)controller framed:(BOOL)framed completion:(ModalCompletionHandler)completion;

+ (void) pop;

SINGLETON_INTERFACE(Modal)

@end

#endif