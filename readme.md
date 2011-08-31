
Bendy Tree iOS Library
======================

### Overview

This iOS library contains many small bits of code that simplify common iOS tasks.

For example, the iOS SDK has no simple method of showing an alert with a text input (like a JavaScript prompt).  So I have a very simple `Prompt` class that works like this:

```objective-c
[Prompt title:@"Enter your name" delegate:self selector:@selector(promptComplete:)];

- (void) promptComplete:(NSString*)val
{
    NSLog(@"The user entered: %@", val);
}
```

### Available Features

Right now the code documents itself.  Here are a few key features so you'll have an idea of what's inside:

 *  Categories on common types like NSString, UIView, NSMutableArray, etc. For example:
    
    > NSString* msg = [@"Hello %@" format:@"Josh"];
    
    > BOOL contains = [@"OU, TU, OSU, MZU" contains:@"OU"];
    
    > [users moveObjectFromIndex:5 toIndex:3];
    
    > UIColor* color = [@"990011" hexStringToColor];
    
    > UIColor* color = [@"990011" hexStringToColor];

 *  Core data wrapper for creating, updating, finding, counting, deleting, etc. This is my favorite module of the whole library:
 
    > NSArray* products = [CD find:[Product class]];
    > for(Product* product in products)
    >   product.Description = @"";
    > [CD save];
    
 *  Easy alerts, prompts, and loading screens:
 
    > [Alert show:@"Hello World"];
    
    > [Prompt title:@"Enter your name" delegate:self selector:@selector(promptComplete:)];
 
    > [Loading show];
 
    > [Loading hide];
    
 *  Easily manage app settings
 
    > NSString* username = [[SettingsRepository current] getString:@"username" orDefault:@"Unknown"];
    
    > [[SettingsRepository current] setString:@"BendyTree" forKey:@"username"];    


### Annoying Dependencies

Some parts of this library have outside dependencies. For example, the string formatting requires a 3rd party Regular Expression library.  If you're not using string formatting, then it would be annoying to satisfy that dependency.  But no worries - you don't have to.

The `BT.h` file controls what pieces of this library compiled.  So if you wanted to use string formatting, then you'd set BT_STRING_FORMATTING to 1.  See the comments at the top of `BT.h` for details.


### Getting Started

1. Clone this repo into a subfolder of your project

```
cd my_xcode_project/libs
git clone git@github.com:bendytree/iOS.git bendytree
```

2. In Xcode, choose "Add Existing Files..." to add these new files

3. Copy `BT-DEMO.h` as `BT.h`

4. Remove both lines in `BT.h` that say "REMOVE THIS LINE" (this activates the page)

5. Add `#import "BT.h"` to your ProjectName-Prefix.pch

6. Choose which modules to include (follow directions in `BT.h`)

