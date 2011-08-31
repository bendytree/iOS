//
//  ExpandableController.h
//  YourAppHereAppSource
//
//  Created by JOSHUA WRIGHT on 10/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ExpandableController : UIViewController {
    
}

@property (retain) NSArray* controllers;
@property (retain) UIScrollView* scroller;
@property (assign) int initialHeight;

- (id) initWithControllers:(NSArray*)_controllers height:(int)_height;

- (void) performSelectorOnControllers:(SEL)selector;
- (void) updateHeight:(int)_height;

+ (void) repositionParentOf:(UIViewController*)controller;

@end
