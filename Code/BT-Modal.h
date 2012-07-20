#if BT_BASICS

//
//  BT-Modal.h
//  BuzzamApp
//
//  Created by Josh Wright on 1/22/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ModalHandler)();


enum {
    ModalAnimationNone,
    ModalAnimationSlideUp,
    ModalAnimationSlideDown,
    ModalAnimationBounce,
    ModalAnimationFade
};
typedef NSInteger ModalAnimation;


@interface Modal : NSObject
@property (retain) UIViewController* controller;
@property (assign) BOOL framed;
@property (assign) ModalAnimation pushAnimation;
@property (assign) ModalAnimation popAnimation;
@property (copy) ModalHandler willPop;
@property (copy) ModalHandler didPop;
@property (copy) ModalHandler didPush;

- (void) pop;
- (void) push;
+ (void) push:(UIViewController*)controller;
+ (void) push:(UIViewController*)controller framed:(BOOL)framed;

+ (void) popLatest;
+ (void) popAll;

@end

#endif