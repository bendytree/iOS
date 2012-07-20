#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 5/8/10.
//  Copyright 2010 Bendy Tree iOS Library. All rights reserved.
//

#import "BT-UIView.h"


@implementation UIView (BT)

- (void) show
{
    [self setHidden:NO];
}

- (void) hide
{
    [self setHidden:YES];
}

- (void) setX:(int)x
{
    [self setFrame: CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
}

- (void) setY:(int)y
{
    [self setFrame: CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height)];
}

- (void) setY:(int)y andHeight:(int)height
{
    [self setFrame: CGRectMake(self.frame.origin.x, y, self.frame.size.width, height)];
}

- (void) setCenterY:(int)y
{
    [self setCenter: CGPointMake(self.center.x, y)];
}

- (void) setWidth:(int)width
{
    [self setFrame: CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height)];
}

- (void) setHeight:(int)height
{
    [self setFrame: CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height)];
}

- (void) setWidth:(int)width andHeight:(int)height
{
    [self setFrame: CGRectMake(self.frame.origin.x, self.frame.origin.y, width, height)];
}

- (void) moveX:(int)amount
{
    [self setFrame: CGRectMake(self.frame.origin.x+amount, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
}

- (void) moveY:(int)amount
{
    [self setFrame: CGRectMake(self.frame.origin.x, self.frame.origin.y+amount, self.frame.size.width, self.frame.size.height)];
}

- (void) moveX:(int)xAmount andY:(int)yAmount
{
    [self setFrame: CGRectMake(self.frame.origin.x+xAmount, self.frame.origin.y+yAmount, self.frame.size.width, self.frame.size.height)];
}

- (void) setX:(int)x andWidth:(int)width
{
    [self setFrame: CGRectMake(x, self.frame.origin.y, width, self.frame.size.height)];
}

- (void) setX:(int)x andY:(int)y
{
    [self setFrame: CGRectMake(x, y, self.frame.size.width, self.frame.size.height)];
}

- (void) setOrigin:(CGSize)size
{
    [self setFrame: CGRectMake(size.width, size.height, self.frame.size.width, self.frame.size.height)];
}

- (void) setOriginPoint:(CGPoint)size
{
    [self setFrame: CGRectMake(size.x, size.y, self.frame.size.width, self.frame.size.height)];
}

- (void) setSize:(CGSize)size
{
    [self setFrame: CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height)];
}

- (void) moveToBottom
{
    [self setFrame: CGRectMake(self.frame.origin.x, self.superview.frame.size.height-self.frame.size.height, self.frame.size.width, self.frame.size.height)];
}

- (void) moveToTop
{
    [self setFrame: CGRectMake(0, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
}

- (void) replaceWith:(UIView*)newView
{
    [newView setFrame:self.frame];
    [newView setBounds:self.bounds];
    [newView setAutoresizingMask:self.autoresizingMask];
    [self.superview insertSubview:newView aboveSubview:self];
    [self removeFromSuperview];
}

- (void) setSameSizeAsParent
{
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.superview.frame.size.width, self.superview.frame.size.height)];
}

- (void) coverSuperview
{
    [self setFrame:CGRectMake(0, 0, self.superview.frame.size.width, self.superview.frame.size.height)];
}

@end


#endif