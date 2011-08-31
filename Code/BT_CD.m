//
//  CDManager.m
//  TestCoreData4
//
//  Created by JOSHUA WRIGHT on 5/24/11.
//  Copyright 2011 BendyTree. All rights reserved.
//

#import "CD.h"

@interface CD()
+ (CD*) current;
@property (nonatomic, retain) NSManagedObjectContext* context;
@property (nonatomic, retain) NSManagedObjectModel* model;
@property (nonatomic, retain) NSPersistentStoreCoordinator* coordinator;
@end


@implementation CD

@synthesize context, model, coordinator;

- (id)init {
    self = [super init];
    if (self) {
        
        NSURL *modelURL = [NSURL fileURLWithPath: [[NSBundle mainBundle]  pathForResource:@"Model" ofType:@"momd"]];
        self.model = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL] autorelease];   
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *myPathDocs =  [documentsDirectory stringByAppendingPathComponent:@"Model.sqlite"];
        NSURL *storeURL = [NSURL fileURLWithPath:myPathDocs];
        
        NSError *error = nil;
        self.coordinator = [[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.model] autorelease];
        if (![self.coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        
        self.context = [[[NSManagedObjectContext alloc] init] autorelease];
        [self.context setPersistentStoreCoordinator:self.coordinator];
        
    }
    return self;
}


#pragma mark - Public Methods

+ (void) save
{
    CD* cd = [CD current];
    
    NSError *error = nil;
    if (cd.context != nil)
    {
        if ([cd.context hasChanges] && ![cd.context save:&error])
        {
            NSLog(@"Unresolved error saving %@, %@", error, [error userInfo]);
            //abort();
        } 
    }
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
    CD* cd = [CD current];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    //entity description
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:[modelClass description] inManagedObjectContext:cd.context];
    [request setEntity:entityDesc];
    
    //filter
    if(filter != nil)
        [request setPredicate:filter];
    
    if(sort != nil)
        [request setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    if(max >= 0)
        [request setFetchLimit:max];
    
    NSError *error = nil;    
    NSMutableArray* results = [NSMutableArray arrayWithArray:[cd.context executeFetchRequest:request error:&error]];
    [request release];
    
    if(error){
        NSLog(@"Unresolved error finding %@, %@", error, [error userInfo]);
    }
    
    return results;
}

+ (int) count:(Class)modelClass
{
    return [self count:modelClass where:nil];
}

+ (int) count:(Class)modelClass where:(NSPredicate*)filter
{
    CD* cd = [CD current];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    //entity description
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:[modelClass description] inManagedObjectContext:cd.context];
    [request setEntity:entityDesc];
    
    //filter
    if(filter != nil)
        [request setPredicate:filter];
    
    NSError *error = nil;    
    int count = [cd.context countForFetchRequest:request error:&error];
    [request release];
    
    if(error){
        NSLog(@"Unresolved error finding %@, %@", error, [error userInfo]);
    }
    
    return count;
}

+ (id) new:(Class)modelClass
{
    CD* cd = [CD current];
    return [NSEntityDescription insertNewObjectForEntityForName:[modelClass description] inManagedObjectContext:cd.context];
}

+ (void) deleteAll:(Class)modelClass
{
    for(NSManagedObject* obj in [CD find:modelClass]){
        [CD delete:obj]; 
    }
}

+ (void) delete:(NSManagedObject*)obj
{
    [[CD current].context deleteObject:obj];
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



- (void)dealloc
{
    self.context = nil;
    self.model = nil;
    self.coordinator = nil;
    
    [super dealloc];
}


@end
