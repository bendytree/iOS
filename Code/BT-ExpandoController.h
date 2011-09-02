#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 10/23/10.
//  Copyright 2010 Bendy Tree iOS Library. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ExpandoController : UIViewController {
    
}

@property (retain) NSArray* controllers;
@property (retain) UIScrollView* scroller;
@property (assign) int initialHeight;

- (id) initWithControllers:(NSArray*)_controllers height:(int)_height;

- (void) performSelectorOnControllers:(SEL)selector;

@end

#endif BT_UI