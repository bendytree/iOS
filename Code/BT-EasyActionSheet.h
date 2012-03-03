//
//  EasyActionSheet.h
//  ByHeart
//
//  Created by JOSHUA WRIGHT on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^EasyActionSheetCompletionHandler)(int);

@interface EasyActionSheet : UIActionSheet<UIActionSheetDelegate> {
    
}

+ (void) showWithTitle:(NSString *)title buttons:(NSArray*)buttons onComplete:(EasyActionSheetCompletionHandler)_onComplete;

@end
