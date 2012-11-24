//
//  PSTMatcherRegistry.m
//  Beehive
//
//  Created by Ryan Davies on 14/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "PSTMatcherRegistry.h"
#import "PSTMatcher.h"
#import "NSObject+PSTHierarchy.h"

@implementation PSTMatcherRegistry

+ (id)sharedRegistry
{
    static dispatch_once_t pred;
    static PSTMatcherRegistry *registry = nil;
    dispatch_once(&pred, ^{ registry = [[self alloc] init]; });
    return registry;
}

- (id)init
{
    if (self = [super init]) {
        self.registeredClasses = [PSTMatcher subclasses];
    }
    
    return self;
}

- (Class)classWhoseInstancesRespondToSelector:(SEL)selector
{
    NSUInteger indexOfClass = [[self registeredClasses] indexOfObjectPassingTest:^BOOL(Class klass, NSUInteger idx, BOOL *stop) {
        return [klass instancesRespondToSelector:selector];
    }];
    
    if (indexOfClass == NSNotFound) return nil;
    return [[self registeredClasses] objectAtIndex:indexOfClass];
}

@end
