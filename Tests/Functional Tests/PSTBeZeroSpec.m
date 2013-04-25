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

SpecBegin(PSTMatchingNumbers)

describe(@"should be zero", ^{
    it(@"should not throw an exception if subject is zero", PENDING);
    it(@"should throw an exception if subject is not zero", PENDING);
});

describe(@"should not be zero", ^{
    it(@"should not throw an exception if subject is not zero", PENDING);
    it(@"should throw an exception if subject is zero", PENDING);
});

describe(@"should be positive", ^{
    it(@"should not throw an exception if subject is larger than zero", PENDING);
    it(@"should throw an exception if subject is zero", PENDING);
    it(@"should throw an exception if subject is smaller than zero", PENDING);
});

describe(@"should not be positive", ^{
    it(@"should not throw an exception if subject is zero", PENDING);
    it(@"should not throw an exception if subject is smaller than zero", PENDING);
    it(@"should throw an exception if subject is larger than zero", PENDING);
});

describe(@"should be negative", ^{
    it(@"should not throw an exception if subject is smaller than zero", PENDING);
    it(@"should throw an exception if subject is zero", PENDING);
    it(@"should throw an exception if subject is larger than zero", PENDING);
});

describe(@"should not be negative", ^{
    it(@"should not throw an exception if subject is zero", PENDING);
    it(@"should not throw an exception if subject is smaller than zero", PENDING);
    it(@"should throw an exception if subject is larger than zero", PENDING);
});

describe(@"should be greater than", ^{
    it(@"should not throw an exception if subject is greater than", PENDING);
    it(@"should throw an exception if subject is equal", PENDING);
    it(@"should throw an exception if subject is less", PENDING);
});

describe(@"should not be greater than", ^{
    it(@"should not throw an exception if subject is equal", PENDING);
    it(@"should not throw an exception if subject is less", PENDING);
    it(@"should throw an exception if subject is greater", PENDING);
});

describe(@"should be less than", ^{
    it(@"should not throw an exception if subject is less", PENDING);
    it(@"should throw an exception if subject is equal", PENDING);
    it(@"should throw an exception if subject is greater", PENDING);
});

describe(@"should not be less than", ^{
    it(@"should not throw an exception if subject is equal", PENDING);
    it(@"should not throw an exception if subject is greater", PENDING);
    it(@"should throw an exception if subject is less", PENDING);
});

describe(@"should be greater than or equal to", ^{
    it(@"should not throw an exception if subject is greater", PENDING);
    it(@"should not throw an exception if subject is equal", PENDING);
});

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
