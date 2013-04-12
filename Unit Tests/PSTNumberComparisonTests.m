// The MIT License
// 
// Copyright (c) 2013 Ryan Davies
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "PSTNumberComparison.h"

@interface PSTNumberComparisonTests : SenTestCase
@end

@implementation PSTNumberComparisonTests

#pragma mark isZero

- (void)test_IsZero_ReturnsTrueIfZero
{
    STAssertTrue([@0 isZero], @"Expected @0 to be considered zero.");
}

- (void)test_IsZero_ReturnsFalseIfNot
{
    STAssertFalse([@1 isZero], @"Expected @1 not to be considered zero.");
}

#pragma mark isPositive

- (void)test_IsPositive_ReturnsTrueIfPositive
{
    STAssertTrue([@1 isPositive], @"Expected 1 to be considered positive.");
    STAssertTrue([@100 isPositive], @"Expected 100 to be considered positive.");
}

- (void)test_IsPositive_ReturnsFalseIfZero
{
    STAssertFalse([@0 isPositive], @"Expected 0 not to be considered positive.");
}

- (void)test_IsPositive_ReturnsFalseIfNegative
{
    STAssertFalse([@(-1) isPositive], @"Expected -1 not to be considered positive.");
    STAssertFalse([@(-100) isPositive], @"Expected -100 not to be considered positive.");
}

#pragma mark isNegative

- (void)test_IsNegative_ReturnsTrueIfNegative
{
    STAssertTrue([@(-1) isNegative], @"Expected -1 to be considered positive.");
    STAssertTrue([@(-100) isNegative], @"Expected -100 to be considered positive.");
}

- (void)test_IsNegative_ReturnsFalseIfZero
{
    STAssertFalse([@0 isNegative], @"Expected 0 not to be considered negative.");
}

- (void)test_IsNegative_ReturnsFalseIfPositive
{
    STAssertFalse([@1 isNegative], @"Expected 1 not to be considered negative.");
    STAssertFalse([@100 isNegative], @"Expected 100 not to be considered negative.");
}

#pragma mark isGreaterThan:

- (void)test_IsGreaterThan_ReturnsTrueIfGreaterThan
{
    STAssertTrue([@2 isGreaterThan:@1], @"Expected 2 to be considered greater than 1.");
}

- (void)test_IsGreaterThan_ReturnsFalseIfEqual
{
    STAssertFalse([@1 isGreaterThan:@1], @"Expected 1 not to be considered greater than 1.");
}

- (void)test_IsGreaterThan_ReturnsFalseIfLessThan
{
    STAssertFalse([@1 isGreaterThan:@2], @"Expected 1 not to be considered greater than 2.");
}

#pragma mark isLessThan:

- (void)test_IsLessThan_ReturnsTrueIfLessThan
{
    STAssertTrue([@1 isLessThan:@2], @"Expected 1 to be considered less than 2.");
}

- (void)test_IsLessThan_ReturnsFalseIfEqual
{
    STAssertFalse([@1 isLessThan:@1], @"Expected 1 not to be considered less than 1.");
}

- (void)test_IsLessThan_ReturnsFalseIfGreaterThan
{
    STAssertFalse([@2 isLessThan:@1], @"Expected 2 not to be considered less than 1.");
}

#pragma mark isGreaterThanOrEqualTo:

- (void)test_IsGreaterThanOrEqualTo_ReturnsTrueIfGreaterThan
{
    STAssertTrue([@2 isGreaterThanOrEqualTo:@1], @"Expected 2 to be greater than or equal to 1.");
}

- (void)test_IsGreaterThanOrEqualTo_ReturnsTrueIfEqual
{
    STAssertTrue([@1 isGreaterThanOrEqualTo:@1], @"Expected 1 to be greater than or equal to 1.");
}

- (void)test_IsGreaterThanOrEqualTo_ReturnsFalseIfLessThan
{
    STAssertFalse([@1 isGreaterThanOrEqualTo:@2], @"Expected 1 not to be greater than or equal to 2.");
}

#pragma mark isLessThanOrEqualTo:

- (void)test_IsLessThanOrEqualTo_ReturnsTrueIfLessThan
{
    STAssertTrue([@1 isLessThanOrEqualTo:@2], @"Expected 1 to be less than or equal to 2.");
}

- (void)test_IsLessThanOrEqualTo_ReturnsTrueIfEqual
{
    STAssertTrue([@1 isLessThanOrEqualTo:@1], @"Expected 1 to be less than or equal to 1.");
}

- (void)test_IsLessThanOrEqualTo_ReturnsFalseIfGreaterThan
{
    STAssertFalse([@2 isLessThanOrEqualTo:@1], @"Expected 2 not to be less than or equal to 1.");
}

#pragma mark isBetween:and:

- (void)test_IsBetween_And_ReturnsTrueIfWithinRange
{
    STAssertTrue([@5 isBetween:@1 and:@10], @"Expected 5 to be between 1 and 10.");
}

- (void)test_IsBetween_And_ReturnsTrueIfAtStartOfRange
{
    STAssertTrue([@5 isBetween:@5 and:@10], @"Expected 5 to be between 5 and 10.");
}

- (void)test_IsBetween_And_ReturnsTrueIfAtEndOfRange
{
    STAssertTrue([@5 isBetween:@1 and:@5], @"Expected 5 to be between 1 and 5.");
}

- (void)test_IsBetween_And_ReturnsFalseIfSmallerThanStartOfRange
{
    STAssertFalse([@1 isBetween:@5 and:@10], @"Expected 1 not to be between 5 and 10.");
}

- (void)test_IsBetween_And_ReturnsFalseIfLargerThanEndOfRange
{
    STAssertFalse([@10 isBetween:@1 and:@5], @"Expected 10 not to be between 1 and 5.");
}

@end
