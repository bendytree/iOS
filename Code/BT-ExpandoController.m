#if BT_BASICS


//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 10/23/10.
//  Copyright 2010 Bendy Tree iOS Library. All rights reserved.
//

#import "BT-ExpandoController.h"
#import "BT-UIView.h"


@implementation ExpandoController

@synthesize controllers, scroller;

- (id) initWithControllers:(NSArray*)_controllers
{
    self = [super init];
    if (self != nil) {
        self.controllers = _controllers;
    }
    return self;
}

- (void) reposition
{
    int height = 0;
    for(UIViewController* c in self.controllers)
    {
        [c.view setY:height];
        int viewHeight = c.view.frame.size.height;   
        height += viewHeight;
    }
    [self.scroller setContentSize:CGSizeMake(self.scroller.frame.size.width, height)];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scroller = [[[UIScrollView alloc] initWithFrame:self.view.frame] autorelease];
    [self.scroller setX:0 andY:0];
    [self.view addSubview:self.scroller];
    
    [self.view setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [self.scroller setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    
    [self.scroller setAutoresizesSubviews:NO];
    
    for(UIViewController* c in self.controllers)
        [self.scroller addSubview:c.view];
    
    [self reposition];
}


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for(UIViewController* c in self.controllers)
    {
        [c viewWillAppear:animated]; 
    }    
}

- (void) performSelectorOnControllers:(SEL)selector
{
    for(id controller in self.controllers)
    {
        if(![controller respondsToSelector:selector]) continue;
        
        [controller performSelector:selector];
    }
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    
    self.controllers = nil;
    self.scroller = nil;
    
    [super dealloc];
}


@end

#endif
