#if BT_BASIC_EXTENSIONS

//  ExpandableController.m
//  YourAppHereAppSource
//
//  Created by JOSHUA WRIGHT on 10/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BT-ExpandoController.h"
#import "BT-UIView.h"


@implementation ExpandoController

@synthesize initialHeight, controllers, scroller;

- (id) initWithControllers:(NSArray*)_controllers height:(int)_initialHeight
{
    self = [super init];
    if (self != nil) {
        self.controllers = _controllers;
        self.initialHeight = _initialHeight;
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
    [self.scroller setContentSize:CGSizeMake(320, height)];
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scroller = [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, self.initialHeight)] autorelease];
    [self.view addSubview:self.scroller];
    [self.view setY:0 andHeight:self.initialHeight]; 
    
    [self.view setAutoresizesSubviews:NO];
    [self.scroller setAutoresizesSubviews:NO];
    
    for(UIViewController* c in self.controllers)
    {
        [self.scroller addSubview:c.view];
    }
    
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
    self.initialHeight = 0;
    
    [super dealloc];
}


@end

#endif
