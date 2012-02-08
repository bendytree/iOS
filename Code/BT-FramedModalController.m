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
    self = [super initWithNibName:@"BT-FramedModalController" bundle:nil];
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
    self.controller.view.layer.cornerRadius = 6;
    border.layer.cornerRadius = 6;
    border.layer.borderWidth = 10;
    border.layer.borderColor = [[UIColor colorWithWhite:.5 alpha:.5] CGColor];
    [border.layer setMasksToBounds:YES];
    [border setOpaque:NO];
    [border setBackgroundColor:[UIColor clearColor]];
    
    [btnClose setBackgroundColor:[UIColor blackColor]];
    btnClose.layer.borderWidth = 2;
    btnClose.layer.cornerRadius = 15;
    btnClose.layer.borderColor = [[UIColor whiteColor] CGColor];
    btnClose.titleLabel.textColor = [UIColor whiteColor];
    [self.view bringSubviewToFront:btnClose];
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
