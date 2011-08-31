    //
//  ExpandableController.m
//  YourAppHereAppSource
//
//  Created by JOSHUA WRIGHT on 10/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ExpandableController.h"
#import "UIView+Position.h"

@interface ExpandableController()

+ (void) addExpandable:(ExpandableController*)expandable;
+ (void) removeExpandable:(ExpandableController*)expandable;

@end


@implementation ExpandableController

@synthesize initialHeight, controllers, scroller;

- (id) initWithControllers:(NSArray*)_controllers height:(int)_initialHeight
{
    self = [super init];
    if (self != nil) {
        self.controllers = _controllers;
        self.initialHeight = _initialHeight;
        
        [ExpandableController addExpandable:self];
        
        [self addObserver:self forKeyPath:@"view.frame" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
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

- (void) updateHeight:(int)_height
{
    [self.scroller setHeight:_height];
    [self.view setHeight:_height];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqual:@"view.frame"]){
        [self.scroller setHeight:self.view.frame.size.height];
        [self reposition];
    }
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
    [self removeObserver:self forKeyPath:@"view.frame"];
    
    self.controllers = nil;
    self.scroller = nil;
    self.initialHeight = 0;
    
    [ExpandableController removeExpandable:self];
    
    [super dealloc];
}




// Singleton
static NSMutableArray* _allExpandables = NULL;
+ (NSMutableArray*) allExpandables
{
    @synchronized(self)
    {
        if(_allExpandables == NULL)
            _allExpandables = [[NSMutableArray alloc] init];
    }
    return _allExpandables;
}

+ (void) addExpandable:(ExpandableController*)expandable
{
    [[ExpandableController allExpandables] addObject:expandable];
}

+ (void) removeExpandable:(ExpandableController*)expandable
{
    [[ExpandableController allExpandables] removeObject:expandable];
}

+ (void) repositionParentOf:(UIViewController*)controller
{
    //[UIView beginAnimations:@"reposition" context:nil];
    //[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    for(ExpandableController* expandable in [self allExpandables])
    {        
        if([expandable.controllers containsObject:controller]){
            [expandable reposition];
        }
    }
    //[UIView commitAnimations];
}

@end
