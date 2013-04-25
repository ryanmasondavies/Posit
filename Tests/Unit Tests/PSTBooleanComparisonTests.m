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
