#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/2/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Prompt : NSObject
+ (void) show:(NSString*)title delegate:(id)del selector:(SEL)sel;
+ (void) show:(NSString*)title delegate:(id)del selector:(SEL)sel context:(id)con;
+ (void) show:(NSString*)title val:(NSString*)val delegate:(id)del selector:(SEL)sel;
+ (void) show:(NSString*)title val:(NSString*)val delegate:(id)del selector:(SEL)sel context:(id)con;
@end


@interface UIPromptView : UIAlertView
- (id)initWithTitle:(NSString *)title delegate:(id)promptDelegate selector:(SEL)selector;
@property (retain) UITextField* textField;
@property (assign) id promptDelegate;
@property (assign) SEL promptSelector;
@end


#endif