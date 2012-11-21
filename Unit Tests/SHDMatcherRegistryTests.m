//
//  SHDMatcherRegistryTests.m
//  Beehive
//
//  Created by Ryan Davies on 14/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "SHDMatcherRegistry.h"
#import "SHDMatcher.h"

@interface SHDSampleMatcher : SHDMatcher
@end

@implementation SHDSampleMatcher
@end

@interface SHDMatcherRegistryTests : SenTestCase
@end

@implementation SHDMatcherRegistryTests

- (void)testSharedRegistryReturnsSameInstance
{
    id sharedRegistry[2];
    sharedRegistry[0] = [SHDMatcherRegistry sharedRegistry];
    sharedRegistry[1] = [SHDMatcherRegistry sharedRegistry];
    STAssertTrue([sharedRegistry[0] isKindOfClass:[SHDMatcherRegistry class]], @"sharedRegistry did not return a matcher registry.");
    STAssertTrue([sharedRegistry[1] isKindOfClass:[SHDMatcherRegistry class]], @"sharedRegistry did not return a matcher registry.");
    STAssertEqualObjects(sharedRegistry[0], sharedRegistry[1], @"sharedRegistry did not return the same instance both times.");
}

- (void)testRegistersSubclassesOfSHDMatcherOnInitialization
{
    SHDMatcherRegistry *registry = [[SHDMatcherRegistry alloc] init];
    STAssertTrue([[registry registeredClasses] containsObject:[SHDSampleMatcher class]], @"SHDSampleMatcher was not registered as a matcher class.");
}

@end
