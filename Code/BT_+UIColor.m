//
//  ColorService.m
//  YourAppHereAppSource
//
//  Created by JOSHUA WRIGHT on 11/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ColorService.h"
#import "UIColor-Expanded.h"

@implementation NSString (BT)

- (UIColor*) hexStringToColor
{
    return [ColorService convertHexStringToColor:self];
}

@end


@implementation UIColor (BT)

- (NSString*) colorToHexString
{
    return [ColorService convertColorToHexString:self];
}

@end



@implementation ColorService

+ (UIColor*) convertHexStringToColor:(NSString*)stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSString *rString = [cString substringWithRange:NSMakeRange(0, 2)];
    NSString *gString = [cString substringWithRange:NSMakeRange(2, 2)];
    NSString *bString = [cString substringWithRange:NSMakeRange(4, 2)];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    unsigned int a = 255;
    if([cString length] >= 8){
        NSString *aString = [cString substringWithRange:NSMakeRange(6, 2)];
        [[NSScanner scannerWithString:aString] scanHexInt:&a];        
    }
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:((float) a / 255.0f)]; 
}

+ (NSString*) convertColorToHexString:(UIColor*)color
{
    NSAssert (color.canProvideRGBComponents, @"Must be a RGB color to use convertColorToHexString");

    CGFloat r, g, b;
    r = color.red;
    g = color.green;
    b = color.blue;

    // Fix range if needed
    if (r < 0.0f) r = 0.0f;
    if (g < 0.0f) g = 0.0f;
    if (b < 0.0f) b = 0.0f;

    if (r > 1.0f) r = 1.0f;
    if (g > 1.0f) g = 1.0f;
    if (b > 1.0f) b = 1.0f;

    // Convert to hex string between 0x00 and 0xFF
    return [NSString stringWithFormat:@"%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)]; 
}

@end
