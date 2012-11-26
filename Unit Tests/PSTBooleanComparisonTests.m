//
//  PSTBooleanComparisonTests.m
//  Posit
//
//  Created by Ryan Davies on 26/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "PSTBooleanComparison.h"

@interface PSTBooleanComparisonTests : SenTestCase
@end

@implementation PSTBooleanComparisonTests

#pragma mark isTrue

- (void)test_IsTrue_ReturnsTrueForNumbersWithBooleanTrueValue
{
    STAssertTrue([@TRUE isTrue], @"Expected true to be evaluated as true.");
}

- (void)test_IsTrue_ReturnsFalseForNumbersWithBooleanFalseValue
{
    STAssertFalse([@FALSE isTrue], @"Expected false not to be evaluated as true.");
}

#pragma mark isFalse

- (void)test_IsFalse_ReturnsTrueForNumbersWithBooleanFalseValue
{
    STAssertTrue([@FALSE isFalse], @"Expected false to be evaluated as false.");
}

- (void)test_IsFalse_ReturnsFalseForNumbersWithBooleanTrueValue
{
    STAssertFalse([@TRUE isFalse], @"Expected true not to be evaluated as false.");
}

@end
