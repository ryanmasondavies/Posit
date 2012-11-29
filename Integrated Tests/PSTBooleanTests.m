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

- (void)setUp {}
- (void)tearDown {}

#pragma mark beTrue

- (void)test_BeTrue_SucceedsIfSubjectIsTrue
{
    STAssertNoThrow([[@TRUE should] beTrue], @"Expected statement not to throw an exception.");
}

- (void)test_BeTrue_FailsIfSubjectIsFalse
{
    PSTVerifyBlockRaisesExceptionWithReason([[@TRUE should] beFalse], @"Expected 1 to be false.");
}

- (void)test_BeTrue_Negative_SucceedsIfSubjectIsFalse
{
    STAssertNoThrow([[@TRUE shouldNot] beFalse], @"Expected statement not to throw an exception.");
}

- (void)test_BeTrue_Negative_FailsIfSubjectIsFalse
{
    PSTVerifyBlockRaisesExceptionWithReason([[@TRUE shouldNot] beTrue], @"Expected 1 not to be true.");
}

#pragma mark beFalse

- (void)test_BeFalse_SucceedsIfSubjectIsFalse
{
    STAssertNoThrow([[@FALSE should] beFalse], @"Expected statement not to throw an exception.");
}

- (void)test_BeFalse_FailsIfSubjectIsTrue
{
    PSTVerifyBlockRaisesExceptionWithReason([[@TRUE should] beFalse], @"Expected 1 to be false.");
}

- (void)test_BeFalse_Negative_SucceedsIfSubjectIsTrue
{
    STAssertNoThrow([[@TRUE shouldNot] beFalse], @"Expected statement not to throw an exception.");
}

- (void)test_BeFalse_Negative_FailsIfSubjectIsFalse
{
    PSTVerifyBlockRaisesExceptionWithReason([[@FALSE shouldNot] beFalse], @"Expected 0 not to be false.");
}

@end
