#if BT_CD

//
//  Bendy Tree iOS Library
//
//  Created by JOSHUA WRIGHT on 5/24/11.
//  Copyright 2011 BendyTree. All rights reserved.
//

#import "BT-CD.h"

@interface CD()
+ (CD*) current;
@property (retain) NSOperationQueue* queue;
@property (nonatomic, retain) NSManagedObjectContext* context;
@property (nonatomic, retain) NSManagedObjectModel* model;
@property (nonatomic, retain) NSPersistentStoreCoordinator* coordinator;
@end


@implementation CD

@synthesize queue, context, model, coordinator;

+ (NSString*) pathToSql
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *myPathDocs =  [documentsDirectory stringByAppendingPathComponent:@"Model.sqlite"];
    return myPathDocs;
}

- (id)init {
    self = [super init];
    if (self) {
        
        self.queue = [NSOperationQueue new];
        [self.queue setMaxConcurrentOperationCount:1];

        
        __block CD* cd = self;
        NSOperation* op = [NSBlockOperation blockOperationWithBlock:^{
            cd.model = [NSManagedObjectModel mergedModelFromBundles:nil];
            
            NSURL *storeURL = [NSURL fileURLWithPath:[CD pathToSql]];
            
            NSError *error = nil;
            
            //Automatic migration
            NSDictionary* options = [NSDictionary dictionaryWithObjectsAndKeys:
                                     [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                                     [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
            
            cd.coordinator = [[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:cd.model] autorelease];
            if (![cd.coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error])
                NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            
            cd.context = [[[NSManagedObjectContext alloc] init] autorelease];
            [cd.context setPersistentStoreCoordinator:cd.coordinator];
        }];
        [cd.queue addOperation:op];
        
    }
    return self;
}


- (void)dealloc
{
    [self.queue cancelAllOperations];
    self.queue = nil;
    self.context = nil;
    self.model = nil;
    self.coordinator = nil;
    
    [super dealloc];
}


#pragma mark - Public Methods

+ (void) save
{
    __block CD* cd = [CD current];
    
    NSOperation* op = [NSBlockOperation blockOperationWithBlock:^{
        NSError* error = nil;
        if ([cd.context hasChanges] && ![cd.context save:&error])
        {
            NSLog(@"Unresolved error saving %@, %@", error, [error userInfo]);
            //abort();
        }
    }];
    [cd.queue addOperation:op];
}

+ (NSMutableArray*) find:(Class)modelClass
{
    return [CD find:modelClass where:nil];
}

+ (NSMutableArray*) find:(Class)modelClass where:(NSPredicate*)filter
{
    return [self find:modelClass where:filter sort:nil];
}

+ (NSMutableArray*) find:(Class)modelClass where:(NSPredicate*)filter sort:(NSSortDescriptor*)sort
{
    return [self find:modelClass where:filter sort:sort max:0];
}

+ (NSMutableArray*) find:(Class)modelClass where:(NSPredicate*)filter sort:(NSSortDescriptor*)sort max:(int)max
{
    return [self find:modelClass where:filter sorts:(sort == nil ? nil : [NSArray arrayWithObject:sort]) max:max];
}

+ (NSMutableArray*) find:(Class)modelClass where:(NSPredicate*)filter sorts:(NSArray*)sorts max:(int)max
{
    __block CD* cd = [CD current];
    __block NSMutableArray* results = nil;
    
    NSOperation* op = [NSBlockOperation blockOperationWithBlock:^{
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        
        //entity description
        NSEntityDescription *entityDesc = [NSEntityDescription entityForName:[modelClass description] inManagedObjectContext:cd.context];
        [request setEntity:entityDesc];
        
        //filter
        if(filter != nil)
            [request setPredicate:filter];
        
        if(sorts != nil)
            [request setSortDescriptors:sorts];
        
        if(max >= 0)
            [request setFetchLimit:max];
        
        NSError *error = nil;
        //NSLog(@"CD finding on main thread: %@", [NSThread isMainThread] ? @"YES" : @"NO");
        
        results = [NSMutableArray arrayWithArray:[cd.context executeFetchRequest:request error:&error]];
        [results retain];
        [request release];
        
        if(error){
            NSLog(@"Unresolved error finding %@, %@", error, [error userInfo]);
        }
    }];
    [cd.queue addOperation:op];
    [op waitUntilFinished];

    [results autorelease];
    return results;
}

+ (id) firstOrNil:(Class)modelClass where:(NSPredicate*)filter
{
    NSArray* all = [self find:modelClass where:filter sort:nil max:1];
    return [all count] == 0 ? nil : [all first];
}

+ (int) count:(Class)modelClass
{
    return [self count:modelClass where:nil];
}

+ (int) count:(Class)modelClass where:(NSPredicate*)filter
{
    __block CD* cd = [CD current];
    __block int count = 0;
    
    NSOperation* op = [NSBlockOperation blockOperationWithBlock:^{
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        
        //entity description
        NSEntityDescription *entityDesc = [NSEntityDescription entityForName:[modelClass description] inManagedObjectContext:cd.context];
        [request setEntity:entityDesc];
        
        //filter
        if(filter != nil)
            [request setPredicate:filter];
        
        NSError *error = nil; 
        count = [cd.context countForFetchRequest:request error:&error];
        [request release];
        
        if(error){
            NSLog(@"Unresolved error finding count %@, %@", error, [error userInfo]);
        }
    }];
    [cd.queue addOperation:op];
    [op waitUntilFinished];
    
    return count;
}

+ (BOOL) exists:(Class)modelClass where:(NSPredicate*)filter
{
    return [CD count:modelClass where:filter] > 0;
}

+ (id) create:(Class)modelClass
{
    __block CD* cd = [CD current];
    __block NSEntityDescription* entity = nil;
    
    NSOperation* op = [NSBlockOperation blockOperationWithBlock:^{
        entity = [NSEntityDescription insertNewObjectForEntityForName:[modelClass description] inManagedObjectContext:cd.context];
        [entity retain];
    }];
    [cd.queue addOperation:op];
    [op waitUntilFinished];
    
    [entity autorelease];
    return entity;
}

+ (void) deleteAll:(Class)modelClass
{
    for(NSManagedObject* obj in [CD find:modelClass]){
        [CD delete:obj]; 
    }
}

+ (void) delete:(NSManagedObject*)obj
{
    __block CD* cd = [CD current];
    
    NSOperation* op = [NSBlockOperation blockOperationWithBlock:^{
        [cd.context deleteObject:obj];
    }];
    [cd.queue addOperation:op];
}

+ (void) delete:(Class)modelClass where:(NSPredicate*)filter
{
    for(NSManagedObject* obj in [CD find:modelClass where:filter]){
        [CD delete:obj]; 
    }
}


#pragma mark - Singleton

static CD* _current = NULL;
+ (CD*) current
{
    @synchronized(self)
    {
        if (_current == NULL)
            _current = [[self alloc] init];
    }
    return _current;
}

+ (void) boot
{
    [self current];
}

@end

#endif