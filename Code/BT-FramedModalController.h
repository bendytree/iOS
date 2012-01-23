//
//  BT-FramedModalController.h
//  BuzzamApp
//
//  Created by Josh Wright on 1/22/12.
//  Copyright (c) 2012 Bendy Tree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FramedModalController : UIViewController{
    
    IBOutlet UIView* placeholder;
    
}

- (id)initWithController:(UIViewController*)_controller;

- (IBAction) pressedClose;

@end
