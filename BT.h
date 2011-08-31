//#if XYXYYYXYXYXYXXY   //<-- REMOVE THIS LINE ---------------------------------<<

/**
 *
 *  This is an example header file. It allows you to select which modules to add
 *  to your XCode build. Here's how to use this file:
 *
 *  Step 1) Copy this file into your project "BendyTree.h"
 *
 *  Step 2) Remove the 2 lines that comment this out (first & last of whole page)
 *
 *  Step 3) Add `#import "BendyTree.h"` to your ProjectName-Prefix.pch
 *
 *  Step 4) For each module you want, change 0 to 1
 *
 *  Step 5) Be sure to add any dependencies listed next to the module
 *  
 */


/**
 *  USER INTERFACE
 *
 *  Lots of random UI elements like prompts (alerts with textboxes), fullscreen
 *  loading spinners, and more.
 *
 *  Dependencies
 *      JSON:  
 */

#define BT_UI 1


/**
 *  NOT A MODULE
 *
 *  These are import statements for each module.  Do not change these.
 */

#import "BT_UI.h"

 
//#endif   //<-- REMOVE THIS LINE ------------------------------------------------<<