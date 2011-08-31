//
//  ColorService.h
//  YourAppHereAppSource
//
//  Created by JOSHUA WRIGHT on 11/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Color)

- (UIColor*) hexStringToColor;

@end

@interface UIColor (Color)

- (NSString*) colorToHexString;

@end



@interface ColorService : NSObject

+ (UIColor*) convertHexStringToColor:(NSString*)hex;
+ (NSString*) convertColorToHexString:(UIColor*)color;

@end
