//
//  ColorService.h
//  YourAppHereAppSource
//
//  Created by JOSHUA WRIGHT on 11/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BT)

- (UIColor*) hexStringToColor;

@end

@interface UIColor (BT)

- (NSString*) colorToHexString;

@end



@interface ColorService : NSObject

+ (UIColor*) convertHexStringToColor:(NSString*)hex;
+ (NSString*) convertColorToHexString:(UIColor*)color;

@end
