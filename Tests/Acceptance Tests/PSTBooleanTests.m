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
