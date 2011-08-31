//
//  AlertService.h
//  GoogleVoiceTwo
//
//  Created by JOSHUA WRIGHT on 8/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AlertService : NSObject {

}

+ (void) show:(NSString*)title withMessage:(NSString*)message;
+ (void) show:(NSString*)message;

@end
