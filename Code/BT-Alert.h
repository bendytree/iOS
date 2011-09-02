#if BT_BASIC_EXTENSIONS

//
//  AlertService.h
//  GoogleVoiceTwo
//
//  Created by JOSHUA WRIGHT on 8/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Alert : NSObject

+ (void) show:(NSString*)title message:(NSString*)msg;
+ (void) show:(NSString*)message;

@end

#endif