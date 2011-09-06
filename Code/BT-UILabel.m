#if BT_BASICS

//
//  BT-UILabel.m
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/5/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import "BT-UILabel.h"

@implementation UILabel (BT_UILabel)

- (void) sizeHeightToFit
{
    //Calculate the expected size based on the font and linebreak mode of your label
    CGSize expectedLabelSize = [self.text sizeWithFont:self.font 
                                      constrainedToSize:CGSizeMake(self.frame.size.width, 9999) 
                                          lineBreakMode:self.lineBreakMode]; 
    
    //adjust the label the the new height.    
    [self setHeight:expectedLabelSize.height];
}

@end

#endif