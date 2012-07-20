#if BT_BASICS

//
//  BT-Modal.m
//  BuzzamApp
//
//  Created by Josh Wright on 1/22/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import "BT-Modal.h"
#import "BT-FramedModalController.h"


@interface ModalManager : NSObject
@property (retain) NSMutableArray* modals;
@end

@implementation ModalManager
@synthesize modals;
SINGLETON_IMPLEMENTATION(ModalManager)

- (id)init {
    self = [super init];
    if (self) {
        self.modals = [NSMutableArray new];
    }
    return self;
}

@end




@implementation Modal

@synthesize pushAnimation, popAnimation, controller, willPop, didPop, didPush, framed;

- (id)init
{
    self = [super init];
    if (self) {
        self.popAnimation = ModalAnimationNone;
        self.pushAnimation = ModalAnimationNone;
    }
    return self;
}

- (void)dealloc {
    self.controller = nil;
    self.willPop = nil;
    self.didPop = nil;
    self.didPush = nil;
    
    [super dealloc];
}

+ (UIWindow*) win
{
    UIWindow* w = [[UIApplication sharedApplication] keyWindow];    
    return w;
}

+ (void) push:(UIViewController*)controller
{
    [self push:controller framed:NO];
}

+ (void) push:(UIViewController*)controller framed:(BOOL)framed
{
    //add it
    Modal* modal = [[Modal new] autorelease];
    modal.controller = controller;
    modal.framed = framed;
    [modal push];
}

- (void) push
{
    ModalManager* manager = [ModalManager current];
    [manager.modals addObject:self];
    
    if(self.framed){
        self.controller = [[[FramedModalController alloc] initWithController:self.controller] autorelease];
    }
    
    //show it
    UIWindow* w = [Modal win];
    [w addSubview:self.controller.view];
    [self.controller.view setSize:[[UIScreen mainScreen] applicationFrame].size];
    [self.controller.view setOrigin:CGSizeMake(0, w.frame.size.height-self.controller.view.frame.size.height)];
    
    if(self.pushAnimation == ModalAnimationBounce)
    {
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        
        CATransform3D scale1 = CATransform3DMakeScale(0.8, 0.8, 1);
        CATransform3D scale2 = CATransform3DMakeScale(1.05, 1.05, 1);
        CATransform3D scale3 = CATransform3DMakeScale(0.9, 0.9, 1);
        CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
        
        NSArray *frameValues = [NSArray arrayWithObjects:
                                [NSValue valueWithCATransform3D:scale1],
                                [NSValue valueWithCATransform3D:scale2],
                                [NSValue valueWithCATransform3D:scale3],
                                [NSValue valueWithCATransform3D:scale4],
                                nil];
        [animation setValues:frameValues];
        
        NSArray *frameTimes = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.0],
                               [NSNumber numberWithFloat:0.4],
                               [NSNumber numberWithFloat:0.8],
                               [NSNumber numberWithFloat:1.0],
                               nil];    
        [animation setKeyTimes:frameTimes];
        
        animation.fillMode = kCAFillModeForwards;
        animation.removedOnCompletion = NO;
        animation.duration = .2;
        
        [self.controller.view.layer addAnimation:animation forKey:@"popup"];
    }
    
    if(self.pushAnimation == ModalAnimationFade)
    {
        self.controller.view.alpha = 0;
        [UIView animateWithDuration:.3 animations:^{
            self.controller.view.alpha = 1;
        } completion:^(BOOL completed){
            if(self.didPush)
                self.didPush();
        }];
    }
    
    if(self.pushAnimation == ModalAnimationSlideUp)
    {
        CGRect end = self.controller.view.frame;
        [self.controller.view setY:self.controller.view.superview.frame.size.height];
        [UIView animateWithDuration:.4 animations:^{
            self.controller.view.frame = end;
        } completion:^(BOOL completed){
            if(self.didPush)
                self.didPush();
        }];        
    }
    
    if(self.pushAnimation == ModalAnimationSlideDown)
    {
        CGRect end = self.controller.view.frame;
        [self.controller.view setY:-1*self.controller.view.frame.size.height];
        [UIView animateWithDuration:.4 animations:^{
            self.controller.view.frame = end;
        } completion:^(BOOL completed){
            if(self.didPush)
                self.didPush();
        }];        
    }
    
    if(self.pushAnimation == ModalAnimationNone){
        if(self.didPush)
            self.didPush();
    }
}

- (void) pop
{
    NSLog(@"pop");
    
    if(self.willPop)
        self.willPop(); 
    
    if(self.popAnimation == ModalAnimationNone){
        [self.controller.view removeFromSuperview];
        
        if(self.didPop)
            self.didPop(); 
    }else{
        [UIView animateWithDuration:.3 
                         animations:^{
                             if(self.popAnimation == ModalAnimationFade){
                                 [self.controller.view setAlpha:0];
                             }else if(self.popAnimation == ModalAnimationSlideUp){
                                 [self.controller.view setY:-1*self.controller.view.frame.size.height];
                             }else if(self.popAnimation == ModalAnimationSlideDown){
                                 [self.controller.view setY:self.controller.view.superview.frame.size.height];
                             }
                         }
                         completion:^(BOOL completed){
                             [self.controller.view removeFromSuperview];
                             
                             if(self.didPop)
                                 self.didPop(); 
                         }];
    }
    
    ModalManager* m = [ModalManager current];
    [m.modals removeObject:self];
}

+ (void) popLatest
{
    ModalManager* m = [ModalManager current];
    if([m.modals count] == 0) return;
    
    Modal* info = [m.modals last];
    [info pop];    
}

+ (void) popAll
{
    ModalManager* m = [ModalManager current];
    while([m.modals count] > 0){
        [[m.modals lastObject] pop];
    }
}

@end

#endif