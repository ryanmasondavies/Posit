//
//  SHDExpectationTests.m
//  Beehive
//
//  Created by Ryan Davies on 14/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "SHDExpectation.h"
#import "SHDMatcher.h"
#import "SHDMatcherRegistry.h"

@interface SHDSuccessfulMatcher : SHDMatcher
- (BOOL)beAwesome;
@end

@implementation SHDSuccessfulMatcher

- (BOOL)beAwesome
{
    return YES;
}

@end

@interface SHDFailingMatcher : SHDMatcher
- (BOOL)beMediocre;
@end

@implementation SHDFailingMatcher

- (BOOL)beMediocre
{
    return NO;
}

@end

@interface SHDExpectationTests : SenTestCase
@end

@implementation SHDExpectationTests

- (void)testThrowsExceptionIfMatcherFails
{
    SHDExpectation *expectation = [[SHDExpectation alloc] init];
    STAssertThrows([(id)expectation beMediocre], @"Expectation did not throw an exception but should have.");
}

- (void)testDoesNotThrowExceptionIfMatcherSucceeds
{
    SHDExpectation *expectation = [[SHDExpectation alloc] init];
    STAssertNoThrow([(id)expectation beAwesome], @"Expectation did throw an exception but should not have.");
}

- (void)testNegative_ThrowsExceptionIfMatcherSucceeds
{
    SHDExpectation *expectation = [[SHDExpectation alloc] init];
    [expectation setNegative:YES];
    STAssertThrows([(id)expectation beAwesome], @"Expectation did not throw an exception but should have.");
}

- (void)testNegative_DoesNotThrowExceptionIfMatcherFails
{
    SHDExpectation *expectation = [[SHDExpectation alloc] init];
    [expectation setNegative:YES];
    STAssertNoThrow([(id)expectation beMediocre], @"Expectation did throw an exception but should not have.");
}

- (void)testThrowsExceptionIfNoMatcherImplementsSelector
{
    SHDExpectation *expectation = [[SHDExpectation alloc] init];
    STAssertThrows([expectation performSelector:@selector(someNonexistentSelector)], @"Expectation did not throw an exception but should have.");
}

@end
