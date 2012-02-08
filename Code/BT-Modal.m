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

@interface ModalInfo : NSObject
@property (retain) UIViewController* controller;
@property (copy) ModalCompletionHandler completion;
@end
@implementation ModalInfo
@synthesize controller, completion;

- (void)dealloc {
    self.controller = nil;
    self.completion = nil;
    
    [super dealloc];
}
@end


@interface Modal()
@property (retain) NSMutableArray* modalInfos;
@end


@implementation Modal

@synthesize modalInfos;

- (id)init {
    self = [super init];
    if (self) {
        self.modalInfos = [NSMutableArray new];
    }
    return self;
}

- (void)dealloc {
    [self setAllPropertiesToNil];
    
    [super dealloc];
}

+ (UIWindow*) win
{
    return [[UIApplication sharedApplication] keyWindow];
}

+ (void) present:(UIViewController*)controller
{
    [self present:controller framed:NO];
}

+ (void) present:(UIViewController*)controller framed:(BOOL)framed
{
    [self present:controller framed:framed completion:nil];
}

+ (void) present:(UIViewController*)controller framed:(BOOL)framed completion:(ModalCompletionHandler)completion
{
    Modal* m = [Modal current];
    
    if(framed)
        controller = [[[FramedModalController alloc] initWithController:controller] autorelease];

    //add it
    ModalInfo* modalInfo = [[ModalInfo new] autorelease];
    modalInfo.controller = controller;
    modalInfo.completion = completion;
    [m.modalInfos addObject:modalInfo];
    
    //show it
    UIWindow* w = [Modal win];
    [w addSubview:controller.view];
    [controller.view setSize:[[UIScreen mainScreen] applicationFrame].size];
    [controller.view setOrigin:CGSizeMake(0, w.frame.size.height-controller.view.frame.size.height)];
    
    
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation
                                      animationWithKeyPath:@"transform"];
    
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
    
    [controller.view.layer addAnimation:animation forKey:@"popup"];
}

+ (void) pop
{
    Modal* m = [self current];
    if([m.modalInfos count] == 0) return;
    
    ModalInfo* info = [m.modalInfos last];
    [info.controller.view removeFromSuperview];
    info.completion();
    [m.modalInfos removeObject:info];
}

SINGLETON_IMPLEMENTATION(Modal)

@end

#endif