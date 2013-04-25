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
    PSTVerifyBlockRaisesExceptionWithReason([[@1 should] beZero], @"Expected 1 to be zero.");
}

- (void)test_ShouldNot_BeZero_SucceedsIfNotZero
{
    STAssertNoThrow([[@1 shouldNot] beZero], @"Expected statement not to throw an exception.");
}

- (void)test_ShouldNot_BeZero_FailsIfZero
{
    PSTVerifyBlockRaisesExceptionWithReason([[@0 shouldNot] beZero], @"Expected 0 not to be zero.");
}

#pragma mark bePositive

- (void)test_Should_BePositive_SucceedsIfPositive
{
    STAssertNoThrow([[@1 should] bePositive], @"Expected statement not to throw an exception.");
}

- (void)test_Should_BePositive_FailsIfNegative
{
    PSTVerifyBlockRaisesExceptionWithReason([[@(-1) should] bePositive], @"Expected -1 to be positive.");
}

- (void)test_Should_BePositive_FailsIfZero
{
    PSTVerifyBlockRaisesExceptionWithReason([[@0 should] bePositive], @"Expected 0 to be positive.");
}

- (void)test_ShouldNot_BePositive_FailsIfPositive
{
    PSTVerifyBlockRaisesExceptionWithReason([[@1 shouldNot] bePositive], @"Expected 1 not to be positive.");
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
    PSTVerifyBlockRaisesExceptionWithReason([[@(-1) shouldNot] beNegative], @"Expected -1 not to be negative.");
}

- (void)test_Should_BeNegative_SucceedsIfNegative
{
    STAssertNoThrow([[@(-1) should] beNegative], @"Expected statement not to throw an exception.");
}

- (void)test_Should_BeNegative_FailsIfZero
{
    PSTVerifyBlockRaisesExceptionWithReason([[@0 should] beNegative], @"Expected 0 to be negative.");
}

- (void)test_ShouldNot_BeNegative_SucceedsIfPositive
{
    STAssertNoThrow([[@1 shouldNot] beNegative], @"Expected statement not to throw an exception.");
}

- (void)test_ShouldNot_BeNegative_FailsIfNegative
{
    PSTVerifyBlockRaisesExceptionWithReason([[@(-1) shouldNot] beNegative], @"Expected -1 not to be negative.");
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
    PSTVerifyBlockRaisesExceptionWithReason([[@1 should] beGreaterThan:@1], @"Expected 1 to be greater than 1.");
}

- (void)test_Should_BeGreaterThan_FailsIfLessThan
{
    PSTVerifyBlockRaisesExceptionWithReason([[@1 should] beGreaterThan:@2], @"Expected 1 to be greater than 2.");
}

- (void)test_ShouldNot_BeGreaterThan_FailsIfGreaterThan
{
    PSTVerifyBlockRaisesExceptionWithReason([[@2 shouldNot] beGreaterThan:@1], @"Expected 2 not to be greater than 1.");
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
    PSTVerifyBlockRaisesExceptionWithReason([[@2 should] beLessThan:@1], @"Expected 2 to be less than 1.");
}

- (void)test_Should_BeLessThan_FailsIfEqual
{
    PSTVerifyBlockRaisesExceptionWithReason([[@1 should] beLessThan:@1], @"Expected 1 to be less than 1.");
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
    PSTVerifyBlockRaisesExceptionWithReason([[@1 shouldNot] beLessThan:@2], @"Expected 1 not to be less than 2.");
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
    PSTVerifyBlockRaisesExceptionWithReason([[@1 should] beGreaterThanOrEqualTo:@2], @"Expected 1 to be greater than or equal to 2.");
}

- (void)test_ShouldNot_BeGreaterThanOrEqualTo_FailsIfGreaterThan
{
    PSTVerifyBlockRaisesExceptionWithReason([[@2 shouldNot] beGreaterThanOrEqualTo:@1], @"Expected 2 not to be greater than or equal to 1.");
}

- (void)test_ShouldNot_BeGreaterThanOrEqualTo_FailsIfEqual
{
    PSTVerifyBlockRaisesExceptionWithReason([[@1 shouldNot] beGreaterThanOrEqualTo:@1], @"Expected 1 not to be greater than or equal to 1.");
}

- (void)test_ShouldNot_BeGreaterThanOrEqualTo_SucceedsIfLessThan
{
    STAssertNoThrow([[@1 shouldNot] beGreaterThanOrEqualTo:@2], @"Expected statement not to throw an exception.");
}

#pragma mark beLessThanOrEqualTo:

- (void)test_Should_BeLessThanOrEqualTo_FailsIfGreaterThan
{
    PSTVerifyBlockRaisesExceptionWithReason([[@2 should] beLessThanOrEqualTo:@1], @"Expected 2 to be less than or equal to 1.");
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
    PSTVerifyBlockRaisesExceptionWithReason([[@1 shouldNot] beLessThanOrEqualTo:@1], @"Expected 1 not to be less than or equal to 1.");
}

- (void)test_ShouldNot_BeLessThanOrEqualTo_FailsIfLessThan
{
    PSTVerifyBlockRaisesExceptionWithReason([[@1 shouldNot] beLessThanOrEqualTo:@2], @"Expected 1 not to be less than or equal to 2.");
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
    PSTVerifyBlockRaisesExceptionWithReason([[@1 should] beBetween:@2 and:@3], @"Expected 1 to be between 2 and 3.");
}

- (void)test_ShouldNot_BeBetween_And_FailsIfInRange
{
    PSTVerifyBlockRaisesExceptionWithReason([[@2 shouldNot] beBetween:@1 and:@3], @"Expected 2 not to be between 1 and 3.");
}

- (void)test_ShouldNot_BeBetween_And_FailsIfAtStartOfRange
{
    PSTVerifyBlockRaisesExceptionWithReason([[@1 shouldNot] beBetween:@1 and:@3], @"Expected 1 not to be between 1 and 3.");
}

- (void)test_ShouldNot_BeBetween_And_FailsIfAtEndOfRange
{
    PSTVerifyBlockRaisesExceptionWithReason([[@3 shouldNot] beBetween:@1 and:@3], @"Expected 3 not to be between 1 and 3.");
}

- (void)test_ShouldNot_BeBetween_And_SucceedsIfOutOfRange
{
    STAssertNoThrow([[@1 shouldNot] beBetween:@2 and:@3], @"Expected statement not to throw an exception.");
}

@end
