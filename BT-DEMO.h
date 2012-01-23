
/**
 *
 *  This file allows you to select which modules are included in 
 *  your XCode build. This allows you to ignore modules that you
 *  don't want to use which have annoying dependencies.
 *
 *  Include a module by changing 0 to 1.
 *
 *  Add any dependencies described next to the module.
 *  
 *  Be sure to remove the top & bottom lines, otherwize this file is ignored
 *
 *
 *  POSSIBLE DEPENDENCIES:
 *
 *      SBJSON:           https://github.com/stig/json-framework/
 *
 *      RegexKitLite:     http://regexkit.sourceforge.net
 *
 *      ASIHttpRequest:   http://allseeing-i.com/ASIHTTPRequest/Setup-instructions
 *
 *      facebook-ios-sdk: https://github.com/facebook/facebook-ios-sdk
 *
 */



/**
 *  BASIC EXTENSIONS
 *
 *  Categories on populate types like NSString, UIView, NSArray, etc.
 *  Lots of random UI elements like prompts (alerts with textboxes), fullscreen
 *  loading spinners, and more.
 *
 *  Dependencies: None
 */

#define BT_BASICS 1

#import "BT-CustomArray.h"
#import "BT-NSArray.h"
#import "BT-NSMutableArray.h"
#import "BT-NSObject.h"
#import "BT-NSString.h"
#import "BT-NSDate.h"
#import "BT-FuzzyTime.h"
#import "BT-Reflection.h"
#import "BT-CoreTypeConversion.h"
#import "BT-UIView.h"
#import "BT-UIWebView.h"
#import "BT-Device.h"
#import "BT-UUID.h"
#import "BT-Links.h"
#import "BT-ExpandoController.h"
#import "BT-Alert.h"
#import "BT-Prompt.h"
#import "BT-AppSettings.h"
#import "BT-Loading.h"
#import "BT-Callback.h"
#import "BT-Image.h"
#import "BT-UILabel.h"
#import "BT-Logger.h"
#import "BT-JavaScript.h"
#import "BT-Confirm.h"
#import "BT-Macros.h"
#import "BT-Modal.h"

/**
 *  JSON
 *
 *  Serialize and deserialize custom objects to/from JSON.
 *
 *  Dependencies: SBJSON
 */

#define BT_JSON 1

#import "BT-JSON.h"



/**
 *  CORE DATA
 *
 *  Extremely easy access to core data.
 *
 *  Dependencies: The Core Data Framework
 */

#define BT_CD 1

#import "BT-CD.h"



/**
 *  LOCATION
 *
 *  Making location & zip code stuff easier.
 *
 *  Dependencies: The Core Location Framework, Map Kit
 */

#define BT_LOCATION 1

#import "BT-ZipCodeFinder.h"




