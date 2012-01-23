#if BT_CD

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 5/24/11.
//  Copyright 2011 Bendy Tree iOS Library. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CD : NSObject {
    
}

+ (void) save;
+ (id) firstOrNil:(Class)modelClass where:(NSPredicate*)filter;
+ (NSMutableArray*) find:(Class)modelClass;
+ (NSMutableArray*) find:(Class)modelClass where:(NSPredicate*)filter;
+ (NSMutableArray*) find:(Class)modelClass where:(NSPredicate*)filter sort:(NSSortDescriptor*)sort;
+ (NSMutableArray*) find:(Class)modelClass where:(NSPredicate*)filter sort:(NSSortDescriptor*)sort max:(int)max;
+ (int) count:(Class)modelClass;
+ (int) count:(Class)modelClass where:(NSPredicate*)filter;
+ (BOOL) exists:(Class)modelClass where:(NSPredicate*)filter;
+ (id) create:(Class)modelClass;
+ (void) deleteAll:(Class)modelClass;
+ (void) delete:(NSManagedObject*)obj;
+ (void) delete:(Class)modelClass where:(NSPredicate*)filter;

@end

#endif