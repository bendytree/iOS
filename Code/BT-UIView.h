#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 5/8/10.
//  Copyright 2010 Bendy Tree iOS Library. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIView (BT)

- (void) show;
- (void) hide;
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
- (void) moveToTop;
- (void) replaceWith:(UIView*)newView;
- (void) setSameSizeAsParent;
- (void) setSize:(CGSize)size;
- (void) setOriginPoint:(CGPoint)size;

@end

#endif