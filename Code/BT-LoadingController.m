//
//  BT-LoadingController.m
//  SoonerFantasyApp
//
//  Created by Joshua Wright on 9/3/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import "BT-LoadingController.h"
#import <QuartzCore/QuartzCore.h>

@implementation BT_LoadingController

- (id)init
{
    self = [super initWithNibName:@"BT-LoadingController" bundle:nil];
    if (self) {
        // Custom initialization
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
    
    [blackSquare.layer setCornerRadius:5];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
