//
//  UIView+Position.h
//  BibleAppSource
//
//  Created by JOSHUA WRIGHT on 5/8/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIView (Position)

- (void) setX:(int)x;
- (void) setY:(int)y;
- (void) setY:(int)y andHeight:(int)height;
- (void) setX:(int)x andY:(int)y;
- (void) setCenterY:(int)y;
- (void) setWidth:(int)width;
- (void) setWidth:(int)width andHeight:(int)height;
- (void) setX:(int)x andWidth:(int)width;
- (void) setOrigin:(CGSize)size;
- (void) setHeight:(int)height;
- (void) moveY:(int)amount;
- (void) moveX:(int)amount;
- (void) moveX:(int)xAmount andY:(int)yAmount;
- (void) moveToBottom;

@end
