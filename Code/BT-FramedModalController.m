//
//  BT-FramedModalController.m
//  BuzzamApp
//
//  Created by Josh Wright on 1/22/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import "BT-FramedModalController.h"
#import <QuartzCore/QuartzCore.h>

@interface FramedModalController()
@property (retain) UIViewController* controller;
@end


@implementation FramedModalController

@synthesize controller;

- (id)initWithController:(UIViewController*)_controller
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.controller = _controller;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [placeholder replaceWith:self.controller.view];
    self.controller.view.layer.borderWidth = 10;
    self.controller.view.layer.borderColor = [[UIColor colorWithWhite:.5 alpha:.5] CGColor];
    self.controller.view.layer.cornerRadius = 6;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

- (IBAction) pressedClose
{
    [Modal pop];
}

@end
