//
//  SHDExpectationTests.m
//  Beehive
//
//  Created by Ryan Davies on 14/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "SHDExpectation.h"
#import "SHDMatcher.h"

@interface SHDTestMatcher : SHDMatcher

- (BOOL)successfulMethod;
- (BOOL)failureMethod;

@end

@implementation SHDTestMatcher

- (BOOL)successfulMethod { return YES; }
- (BOOL)failureMethod    { return NO;  }

- (NSString *)failureMessageForSelector:(SEL)selector arguments:(NSArray *)arguments
{
    return [NSString stringWithFormat:@"%@ failed.", [self subject]];
}

- (NSString *)negativeFailureMessageForSelector:(SEL)selector arguments:(NSArray *)arguments
{
    return [NSString stringWithFormat:@"%@ succeeded.", [self subject]];
}

@end

@interface SHDExpectationTests : SenTestCase
@end

@implementation SHDExpectationTests

- (void)testThrowsExceptionIfMatcherFails
{
    SHDExpectation *expectation = [[SHDExpectation alloc] init];
    STAssertThrows([(id)expectation failureMethod], @"Expectation did not throw an exception but should have.");
}

- (void)testDoesNotThrowExceptionIfMatcherSucceeds
{
    SHDExpectation *expectation = [[SHDExpectation alloc] init];
    STAssertNoThrow([(id)expectation successfulMethod], @"Expectation did throw an exception but should not have.");
}

- (void)testNegative_ThrowsExceptionIfMatcherSucceeds
{
    SHDExpectation *expectation = [[SHDExpectation alloc] init];
    [expectation setNegative:YES];
    STAssertThrows([(id)expectation successfulMethod], @"Expectation did not throw an exception but should have.");
}

- (void)testNegative_DoesNotThrowExceptionIfMatcherFails
{
    SHDExpectation *expectation = [[SHDExpectation alloc] init];
    [expectation setNegative:YES];
    STAssertNoThrow([(id)expectation failureMethod], @"Expectation did throw an exception but should not have.");
}

- (void)testThrowsExceptionIfNoMatcherImplementsSelector
{
    SHDExpectation *expectation = [[SHDExpectation alloc] init];
    STAssertThrows([expectation performSelector:@selector(someNonexistentSelector)], @"Expectation did not throw an exception but should have.");
}

#pragma mark - Exception messages

- (void)testFailureMessage
{
    @try {
        SHDExpectation *expectation = [[SHDExpectation alloc] initWithSubject:@"Hello World"];
        [(id)expectation failureMethod];
    }
    @catch(NSException *exception) {
        STAssertEqualObjects([exception reason], @"Hello World failed.", @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testNegativeFailureMessage
{
    @try {
        SHDExpectation *expectation = [[SHDExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [(id)expectation successfulMethod];
    }
    @catch(NSException *exception) {
        STAssertEqualObjects([exception reason], @"Hello World succeeded.", @"Exception reason did not match the matcher's negative failure message.");
    }
}

@end
