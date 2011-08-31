//
//  NSString+Awesome.h
//  YourAppHereAppSource
//
//  Created by JOSHUA WRIGHT on 12/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (BT)

- (bool) contains:(NSString*)subtext;
- (bool) containsIgnoreCase:(NSString*)subtext;
- (bool) isEqualIgnoreCase:(NSString*)text;

@end



@interface NSString (Formatting)

- (NSString*) format:(id)obj;

@end


@interface StringFormattingService : NSObject {

}

+ (NSString*) formatString:(NSString*)str withObject:(id)obj;

@end
