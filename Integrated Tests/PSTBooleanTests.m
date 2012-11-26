//
//  PSTBooleanTests.m
//  Posit
//
//  Created by Ryan Davies on 26/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "Posit.h"

@interface PSTBooleanTests : SenTestCase
@end

@implementation PSTBooleanTests

#pragma mark beTrue

- (void)test_BeTrue_SucceedsIfSubjectIsTrue
{
    STAssertNoThrow([[@TRUE should] beTrue], @"Expected statement not to throw an exception.");
}

- (void)test_BeTrue_FailsIfSubjectIsFalse
{
    NSException *exception = nil;
    @try { [[@TRUE should] beFalse]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertNotNil(exception, @"Expected statement to throw an exception");
    STAssertEqualObjects([exception reason], @"Expected 1 to be false.", @"Expected the correct failure message.");
}

- (void)test_BeTrue_Negative_SucceedsIfSubjectIsFalse
{
    STAssertNoThrow([[@TRUE shouldNot] beFalse], @"Expected statement not to throw an exception.");
}

- (void)test_BeTrue_Negative_FailsIfSubjectIsFalse
{
    NSException *exception = nil;
    @try { [[@TRUE shouldNot] beTrue]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertNotNil(exception, @"Expected statement to throw an exception.");
    STAssertEqualObjects([exception reason], @"Expected 1 not to be true.", @"Expected the correct failure message.");
}

#pragma mark beFalse

- (void)test_BeFalse_SucceedsIfSubjectIsFalse
{
    STAssertNoThrow([[@FALSE should] beFalse], @"Expected statement not to throw an exception.");
}

- (void)test_BeFalse_FailsIfSubjectIsTrue
{
    NSException *exception = nil;
    @try { [[@TRUE should] beFalse]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertNotNil(exception, @"Expected statement to throw an exception");
    STAssertEqualObjects([exception reason], @"Expected 1 to be false.", @"Expected the correct failure message.");
}

- (void)test_BeFalse_Negative_SucceedsIfSubjectIsTrue
{
    STAssertNoThrow([[@TRUE shouldNot] beFalse], @"Expected statement not to throw an exception.");
}

- (void)test_BeFalse_Negative_FailsIfSubjectIsFalse
{
    NSException *exception = nil;
    @try { [[@FALSE shouldNot] beFalse]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertNotNil(exception, @"Expected statement to throw an exception.");
    STAssertEqualObjects([exception reason], @"Expected 0 not to be false.", @"Expected the correct failure message.");
}

@end
