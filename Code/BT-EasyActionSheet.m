//
//  EasyActionSheet.m
//  ByHeart
//
//  Created by JOSHUA WRIGHT on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BT-EasyActionSheet.h"


@interface EasyActionSheet()
@property (copy) EasyActionSheetCompletionHandler onComplete;
@end


@implementation EasyActionSheet

@synthesize onComplete;

- (id)initWithTitle:(NSString *)title buttons:(NSArray*)buttons onComplete:(EasyActionSheetCompletionHandler)_onComplete {
    self = [super initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    if (self) {
        self.onComplete = _onComplete;
        
        for(NSString* t in buttons)
        {
            [self addButtonWithTitle:t];
        }
        
        [self addButtonWithTitle:@"Cancel"];
        self.destructiveButtonIndex = [buttons count];
            
    }
    return self;
}

- (void)dealloc
{
    [self setAllPropertiesToNil];
    [super dealloc];
}

+ (void) showWithTitle:(NSString *)title buttons:(NSArray*)buttons onComplete:(EasyActionSheetCompletionHandler)_onComplete
{
    EasyActionSheet* sheet = [[[EasyActionSheet alloc] initWithTitle:title buttons:buttons onComplete:_onComplete] autorelease];
    //[sheet setActionSheetStyle:UIActionSheetStyleBlackOpaque];
    UIWindow* win = [[UIApplication sharedApplication] keyWindow];
    [sheet showInView:win];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(actionSheet.destructiveButtonIndex == buttonIndex)
        return;
    
    self.onComplete(buttonIndex);
}


@end
