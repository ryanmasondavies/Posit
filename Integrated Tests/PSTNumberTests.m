//
//  PSTNumberTests.m
//  Posit
//
//  Created by Ryan Davies on 26/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "Posit.h"

@interface PSTNumberTests : SenTestCase
@end

@implementation PSTNumberTests

- (void)setUp {}
- (void)tearDown {}

#pragma mark beZero

- (void)test_Should_BeZero_SucceedsIfZero
{
    STAssertNoThrow([[@0 should] beZero], @"Expected statement not to throw an exception.");
}

- (void)test_Should_BeZero_FailsIfNotZero
{
    NSException *exception = nil;
    @try { [[@1 should] beZero]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 1 to be zero.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_ShouldNot_BeZero_SucceedsIfNotZero
{
    STAssertNoThrow([[@1 shouldNot] beZero], @"Expected statement not to throw an exception.");
}

- (void)test_ShouldNot_BeZero_FailsIfZero
{
    NSException *exception = nil;
    @try { [[@0 shouldNot] beZero]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 0 not to be zero.", @"Expected statement to throw an exception with a certain message.");
}

#pragma mark bePositive

- (void)test_Should_BePositive_SucceedsIfPositive
{
    STAssertNoThrow([[@1 should] bePositive], @"Expected statement not to throw an exception.");
}

- (void)test_Should_BePositive_FailsIfNegative
{
    NSException *exception = nil;
    @try { [[@(-1) should] bePositive]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected -1 to be positive.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_Should_BePositive_FailsIfZero
{
    NSException *exception = nil;
    @try { [[@0 should] bePositive]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 0 to be positive.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_ShouldNot_BePositive_FailsIfPositive
{
    NSException *exception = nil;
    @try { [[@1 shouldNot] bePositive]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 1 not to be positive.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_ShouldNot_BePositive_SucceedsIfNegative
{
    STAssertNoThrow([[@(-1) shouldNot] bePositive], @"Expected statement not to throw an exception.");
}

- (void)test_ShouldNot_BePositive_SucceedsIfZero
{
    STAssertNoThrow([[@0 shouldNot] bePositive], @"Expected statement not to throw an exception.");
}

#pragma mark beNegative

- (void)test_Should_BeNegative_FailsIfPositive
{
    NSException *exception = nil;
    @try { [[@(-1) shouldNot] beNegative]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected -1 not to be negative.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_Should_BeNegative_SucceedsIfNegative
{
    STAssertNoThrow([[@(-1) should] beNegative], @"Expected statement not to throw an exception.");
}

- (void)test_Should_BeNegative_FailsIfZero
{
    NSException *exception = nil;
    @try { [[@0 should] beNegative]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 0 to be negative.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_ShouldNot_BeNegative_SucceedsIfPositive
{
    STAssertNoThrow([[@1 shouldNot] beNegative], @"Expected statement not to throw an exception.");
}

- (void)test_ShouldNot_BeNegative_FailsIfNegative
{
    NSException *exception = nil;
    @try { [[@(-1) shouldNot] beNegative]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected -1 not to be negative.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_ShouldNot_BeNegative_SucceedsIfZero
{
    STAssertNoThrow([[@0 shouldNot] beNegative], @"Expected statement not to throw an exception.");
}

#pragma mark beGreaterThan:

- (void)test_Should_BeGreaterThan_SucceedsIfGreaterThan
{
    STAssertNoThrow([[@2 should] beGreaterThan:@1], @"Expected statement not to throw an exception.");
}

- (void)test_Should_BeGreaterThan_FailsIfEqual
{
    NSException *exception = nil;
    @try { [[@1 should] beGreaterThan:@1]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 1 to be greater than 1.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_Should_BeGreaterThan_FailsIfLessThan
{
    NSException *exception = nil;
    @try { [[@1 should] beGreaterThan:@2]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 1 to be greater than 2.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_ShouldNot_BeGreaterThan_FailsIfGreaterThan
{
    NSException *exception = nil;
    @try { [[@2 shouldNot] beGreaterThan:@1]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 2 not to be greater than 1.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_ShouldNot_BeGreaterThan_SucceedsIfEqual
{
    STAssertNoThrow([[@1 shouldNot] beGreaterThan:@1], @"Expected statement not to throw an exception.");
}

- (void)test_ShouldNot_BeGreaterThan_SucceedsIfLessThan
{
    STAssertNoThrow([[@(-1) shouldNot] beGreaterThan:@1], @"Expected statement not to throw an exception.");
}

#pragma mark beLessThan:

- (void)test_Should_BeLessThan_FailsIfGreaterThan
{
    NSException *exception = nil;
    @try { [[@2 should] beLessThan:@1]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 2 to be less than 1.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_Should_BeLessThan_FailsIfEqual
{
    NSException *exception = nil;
    @try { [[@1 should] beLessThan:@1]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 1 to be less than 1.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_Should_BeLessThan_SucceedsIfLessThan
{
    STAssertNoThrow([[@1 should] beLessThan:@2], @"Expected statement not to throw an exception.");
}

- (void)test_ShouldNot_BeLessThan_SucceedsIfGreaterThan
{
    STAssertNoThrow([[@2 shouldNot] beLessThan:@1], @"Expected statement not to throw an exception.");
}

- (void)test_ShouldNot_BeLessThan_SucceedsIfEqual
{
    STAssertNoThrow([[@1 shouldNot] beLessThan:@1], @"Expected statement not to throw an exception.");
}

- (void)test_ShouldNot_BeLessThan_FailsIfLessThan
{
    NSException *exception = nil;
    @try { [[@1 shouldNot] beLessThan:@2]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 1 not to be less than 2.", @"Expected statement to throw an exception with a certain message.");
}

#pragma mark beGreaterThanOrEqualTo:

- (void)test_Should_BeGreaterThanOrEqualTo_SucceedsIfGreaterThan
{
    STAssertNoThrow([[@2 should] beGreaterThanOrEqualTo:@1], @"Expected statement not to throw an exception.");
}

- (void)test_Should_BeGreaterThanOrEqualTo_SucceedsIfEqual
{
    STAssertNoThrow([[@1 should] beGreaterThanOrEqualTo:@1], @"Expected statement not to throw an exception.");
}

- (void)test_Should_BeGreaterThanOrEqualTo_FailsIfLessThan
{
    NSException *exception = nil;
    @try { [[@1 should] beGreaterThanOrEqualTo:@2]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 1 to be greater than or equal to 2.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_ShouldNot_BeGreaterThanOrEqualTo_FailsIfGreaterThan
{
    NSException *exception = nil;
    @try { [[@2 shouldNot] beGreaterThanOrEqualTo:@1]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 2 not to be greater than or equal to 1.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_ShouldNot_BeGreaterThanOrEqualTo_FailsIfEqual
{
    NSException *exception = nil;
    @try { [[@1 shouldNot] beGreaterThanOrEqualTo:@1]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 1 not to be greater than or equal to 1.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_ShouldNot_BeGreaterThanOrEqualTo_SucceedsIfLessThan
{
    STAssertNoThrow([[@1 shouldNot] beGreaterThanOrEqualTo:@2], @"Expected statement not to throw an exception.");
}

#pragma mark beLessThanOrEqualTo:

- (void)test_Should_BeLessThanOrEqualTo_FailsIfGreaterThan
{
    NSException *exception = nil;
    @try { [[@2 should] beLessThanOrEqualTo:@1]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 2 to be less than or equal to 1.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_Should_BeLessThanOrEqualTo_SucceedsIfEqual
{
    STAssertNoThrow([[@1 should] beLessThanOrEqualTo:@1], @"Expected statement not to throw an exception.");
}

- (void)test_Should_BeLessThanOrEqualTo_SucceedsIfLessThan
{
    STAssertNoThrow([[@1 should] beLessThanOrEqualTo:@2], @"Expected statement not to throw an exception.");
}

- (void)test_ShouldNot_BeLessThanOrEqualTo_SucceedsIfGreaterThan
{
    STAssertNoThrow([[@2 shouldNot] beLessThanOrEqualTo:@1], @"Expected statement not to throw an exception.");
}

- (void)test_ShouldNot_BeLessThanOrEqualTo_FailsIfEqual
{
    NSException *exception = nil;
    @try { [[@1 shouldNot] beLessThanOrEqualTo:@1]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 1 not to be less than or equal to 1.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_ShouldNot_BeLessThanOrEqualTo_FailsIfLessThan
{
    NSException *exception = nil;
    @try { [[@1 shouldNot] beLessThanOrEqualTo:@2]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 1 not to be less than or equal to 2.", @"Expected statement to throw an exception with a certain message.");
}

#pragma mark beBetween:and:

- (void)test_Should_BeBetween_And_SucceedsIfInRange
{
    STAssertNoThrow([[@2 should] beBetween:@1 and:@3], @"Expected statement not to throw an exception.");
}

- (void)test_Should_BeBetween_And_SucceedsIfAtStartOfRange
{
    STAssertNoThrow([[@1 should] beBetween:@1 and:@3], @"Expected statement not to throw an exception.");
}

- (void)test_Should_BeBetween_And_SucceedsIfAtEndOfRange
{
    STAssertNoThrow([[@3 should] beBetween:@1 and:@3], @"Expected statement not to throw an exception.");
}

- (void)test_Should_BeBetween_And_FailsIfOutOfRange
{
    NSException *exception = nil;
    @try { [[@1 should] beBetween:@2 and:@3]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 1 to be between 2 and 3.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_ShouldNot_BeBetween_And_FailsIfInRange
{
    NSException *exception = nil;
    @try { [[@2 shouldNot] beBetween:@1 and:@3]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 2 not to be between 1 and 3.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_ShouldNot_BeBetween_And_FailsIfAtStartOfRange
{
    NSException *exception = nil;
    @try { [[@1 shouldNot] beBetween:@1 and:@3]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 1 not to be between 1 and 3.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_ShouldNot_BeBetween_And_FailsIfAtEndOfRange
{
    NSException *exception = nil;
    @try { [[@3 shouldNot] beBetween:@1 and:@3]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception reason], @"Expected 3 not to be between 1 and 3.", @"Expected statement to throw an exception with a certain message.");
}

- (void)test_ShouldNot_BeBetween_And_SucceedsIfOutOfRange
{
    STAssertNoThrow([[@1 shouldNot] beBetween:@2 and:@3], @"Expected statement not to throw an exception.");
}

@end
