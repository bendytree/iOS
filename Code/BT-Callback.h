#if BT_BASICS

//
//  BT-Callback.h
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/4/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Callback : NSObject{

id delegate;
SEL selector;

}

- (id) initWithDelegate:(id)_del selector:(SEL)_sel;

- (void) call;
- (void) callWith:(id)arg;
@end


@interface NSObject (BT_Call)
- (Callback*) callback:(SEL)_selector;
@end

#endif