#if BT_BASICS

//
//  Bendy Tree iOS Library
//
//  Created by Joshua Wright on 9/2/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import "BT-Prompt.h"

@implementation Prompt : NSObject

static UIPromptView* prompt = NULL;
static id delegate = NULL;
static SEL selector = NULL;
static id context = NULL;

+ (void) show:(NSString*)title delegate:(id)del selector:(SEL)sel
{
    [Prompt show:title val:@"" delegate:del selector:sel context:nil];
}

+ (void) show:(NSString*)title delegate:(id)del selector:(SEL)sel context:(id)con
{
    [Prompt show:title val:@"" delegate:del selector:sel context:con];
}

+ (void) show:(NSString*)title val:(NSString*)val delegate:(id)del selector:(SEL)sel
{
    [Prompt show:title val:val delegate:del selector:sel context:nil];
}

+ (void) show:(NSString*)title val:(NSString*)val delegate:(id)del selector:(SEL)sel context:(id)con
{
    delegate = del;
    selector = sel;
    context = con;
    
    prompt = [[UIPromptView alloc] initWithTitle:title delegate:self selector:@selector(done:)];
    prompt.textField.text = val;
    [prompt show];
}

+ (void) done:(NSString*)title
{
    [prompt release];
    prompt = nil;
    
    [delegate performSelector:selector withObject:title withObject:context];
}

@end



@implementation UIPromptView

@synthesize textField, promptDelegate, promptSelector;

- (id)initWithTitle:(NSString *)title delegate:(id)_promptDelegate selector:(SEL)selector
{
    if (self = [super initWithTitle:title message:title delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil])
    {
        self.promptDelegate = _promptDelegate;
        self.promptSelector = selector;
        
        UITextField *theTextField = [[[UITextField alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 25.0)] autorelease]; 
        [theTextField setBackgroundColor:[UIColor whiteColor]]; 
        [self addSubview:theTextField];
        self.textField = theTextField;
        self.textField.text = @"";
        
        [self setTransform:CGAffineTransformMakeTranslation(0.0, 40.0)];
    }
    return self;
}

- (void)dealloc {
    self.promptSelector = nil;
    self.promptDelegate = nil;
    self.textField = nil;
    
    [super dealloc];
}

- (void) show
{
    [textField becomeFirstResponder];
    [super show];
}

- (void) alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0){
        [self.promptDelegate performSelector:promptSelector withObject:nil]; 
    }else{
        [self.promptDelegate performSelector:promptSelector withObject:textField.text];
    }
}

@end


#endif