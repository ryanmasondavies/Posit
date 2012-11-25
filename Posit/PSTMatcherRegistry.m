//
//  PSTMatcherRegistry.m
//  Beehive
//
//  Created by Ryan Davies on 14/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "PSTMatcherRegistry.h"
#import "PSTMatcher.h"
#import <objc/objc-runtime.h>

@interface NSObject (PSTHierarchy)
+ (NSArray *)subclasses;
@end

@implementation NSObject (PSTHierarchy)

+ (NSArray *)subclasses
{
    int numberOfClasses = objc_getClassList(NULL, 0);
    Class *classes = NULL;
    
    if (numberOfClasses > 0) {
        NSMutableArray *subclasses = [NSMutableArray array];
        
        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numberOfClasses);
        numberOfClasses = objc_getClassList(classes, numberOfClasses);
        
        for (int i = 0; i < numberOfClasses; i++) {
            if (class_getSuperclass(classes[i]) == [self class]) {
                [subclasses addObject:classes[i]];
            }
        }
        
        free(classes);
        
        return subclasses;
    }
    
    return nil;
}

@end

@implementation PSTMatcherRegistry

+ (Class)classWhoseInstancesRespondToSelector:(SEL)selector
{
    NSArray *subclasses = [PSTMatcher subclasses];
    
    NSUInteger indexOfClass = [subclasses indexOfObjectPassingTest:^BOOL(Class klass, NSUInteger idx, BOOL *stop) {
        return [klass instancesRespondToSelector:selector];
    }];
    
    if (indexOfClass == NSNotFound) return nil;
    return [subclasses objectAtIndex:indexOfClass];
}

@end
