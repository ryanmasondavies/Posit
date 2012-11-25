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
- (BOOL)someMethod;
@end

@implementation PSTSampleMatcher
- (BOOL)someMethod { return NO; }
@end

@interface PSTMatcherRegistryTests : SenTestCase
@end

@implementation PSTMatcherRegistryTests

- (void)testRegistersMatcherSubclasses
{
    STAssertTrue([PSTMatcherRegistry classWhoseInstancesRespondToSelector:@selector(someMethod)] == [PSTSampleMatcher class], @"PSTSampleMatcher was not registered as a matcher class.");
}

@end
