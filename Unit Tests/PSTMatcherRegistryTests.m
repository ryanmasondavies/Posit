//
//  PSTMatcherRegistryTests.m
//  Beehive
//
//  Created by Ryan Davies on 14/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "PSTMatcherRegistry.h"
#import "PSTMatcher.h"

@interface PSTSampleMatcher : PSTMatcher
@end

@implementation PSTSampleMatcher
@end

@interface PSTMatcherRegistryTests : SenTestCase
@end

@implementation PSTMatcherRegistryTests

- (void)testSharedRegistryReturnsSameInstance
{
    id sharedRegistry[2];
    sharedRegistry[0] = [PSTMatcherRegistry sharedRegistry];
    sharedRegistry[1] = [PSTMatcherRegistry sharedRegistry];
    STAssertTrue([sharedRegistry[0] isKindOfClass:[PSTMatcherRegistry class]], @"sharedRegistry did not return a matcher registry.");
    STAssertTrue([sharedRegistry[1] isKindOfClass:[PSTMatcherRegistry class]], @"sharedRegistry did not return a matcher registry.");
    STAssertEqualObjects(sharedRegistry[0], sharedRegistry[1], @"sharedRegistry did not return the same instance both times.");
}

- (void)testRegistersSubclassesOfPSTMatcherOnInitialization
{
    PSTMatcherRegistry *registry = [[PSTMatcherRegistry alloc] init];
    STAssertTrue([[registry registeredClasses] containsObject:[PSTSampleMatcher class]], @"PSTSampleMatcher was not registered as a matcher class.");
}

@end
