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

#import "PSTTestMatcher.h"

@interface PSTExpectationTests : SenTestCase
@end

@implementation PSTExpectationTests

- (void)testRaisesSenTestFailureExceptionsOnFailure
{
    PSTExpectation *expectation = [[PSTExpectation alloc] init];
    
    NSException *exception = nil;
    @try { [(id)expectation failureMethod]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertEqualObjects([exception name], SenTestFailureException, @"Exception was not a SenTestFailureException.");
}

- (void)testSetsExceptionFileNameOnFailure
{
    PSTExpectation *expectation = [[PSTExpectation alloc] init];
    [expectation setFilePath:@"some file"];
    
    NSException *exception = nil;
    @try { [(id)expectation failureMethod]; }
    @catch(NSException *e) { exception = e; }
    STAssertEqualObjects([exception userInfo][SenTestFilenameKey], @"some file", @"Exception file path was not correct.");
}

- (void)testSetsExceptionLineNumberOnFailure
{
    PSTExpectation *expectation = [[PSTExpectation alloc] init];
    [expectation setLineNumber:@32];
    
    NSException *exception = nil;
    @try { [(id)expectation failureMethod]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertEqualObjects([exception userInfo][SenTestLineNumberKey], @32, @"Exception line number was not correct.");
}

- (void)testThrowsExceptionIfMatcherFails
{
    PSTExpectation *expectation = [[PSTExpectation alloc] init];
    STAssertThrows([(id)expectation failureMethod], @"Expectation did not throw an exception but should have.");
}

- (void)testDoesNotThrowExceptionIfMatcherSucceeds
{
    PSTExpectation *expectation = [[PSTExpectation alloc] init];
    STAssertNoThrow([(id)expectation successfulMethod], @"Expectation did throw an exception but should not have.");
}

- (void)testNegative_ThrowsExceptionIfMatcherSucceeds
{
    PSTExpectation *expectation = [[PSTExpectation alloc] init];
    [expectation setNegative:YES];
    STAssertThrows([(id)expectation successfulMethod], @"Expectation did not throw an exception but should have.");
}

- (void)testNegative_DoesNotThrowExceptionIfMatcherFails
{
    PSTExpectation *expectation = [[PSTExpectation alloc] init];
    [expectation setNegative:YES];
    STAssertNoThrow([(id)expectation failureMethod], @"Expectation did throw an exception but should not have.");
}

- (void)testThrowsExceptionIfNoMatcherImplementsSelector
{
    PSTExpectation *expectation = [[PSTExpectation alloc] init];
    STAssertThrows([expectation performSelector:@selector(someNonexistentSelector)], @"Expectation did not throw an exception but should have.");
}

#pragma mark - Failure message

- (void)testFailureMessageWithNoArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethod];
    }
    @catch(NSException *exception) {
        STAssertEqualObjects([exception reason], @"Hello World failed.", @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testFailureMessageWithNullArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethodWithNull:nil andNull:NULL];
    }
    @catch(NSException *exception) {
        STAssertEqualObjects([exception reason], @"Hello World failed with arguments <null>, <null>.", @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testFailureMessageWithObjectArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethodWithObject:@"Foo" andObject:@"Bar"];
    }
    @catch(NSException *exception) {
        STAssertEqualObjects([exception reason], @"Hello World failed with arguments Foo, Bar.", @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testFailureMessageWithClassArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethodWithClass:[NSObject class] andClass:[NSString class]];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World failed with arguments %@, %@.", [NSObject class], [NSString class]];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testFailureMessageWithSelectorArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethodWithSelector:@selector(one) andSelector:@selector(two)];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World failed with arguments %@, %@.", NSStringFromSelector(@selector(one)), NSStringFromSelector(@selector(two))];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testFailureMessageWithBooleanArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethodWithBoolean:true andBoolean:false];
    }
    @catch(NSException *exception) {
        STAssertEqualObjects([exception reason], @"Hello World failed with arguments 1, 0.", @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testFailureMessageWithCharArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethodWithChar:CHAR_MIN andChar:CHAR_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World failed with arguments %@, %@.", @(CHAR_MIN), @(CHAR_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testFailureMessageWithDoubleArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethodWithDouble:DBL_MIN andDouble:DBL_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World failed with arguments %@, %@.", @(DBL_MIN), @(DBL_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testFailureMessageWithFloatArgument
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethodWithFloat:FLT_MIN andFloat:FLT_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World failed with arguments %@, %@.", @(FLT_MIN), @(FLT_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testFailureMessageWithIntArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethodWithInt:INT_MIN andInt:INT_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World failed with arguments %@, %@.", @(INT_MIN), @(INT_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testFailureMessageWithLongArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethodWithLong:LONG_MIN andLong:LONG_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World failed with arguments %@, %@.", @(LONG_MIN), @(LONG_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testFailureMessageWithLongLongArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethodWithLongLong:LLONG_MIN andLongLong:LLONG_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World failed with arguments %@, %@.", @(LONG_LONG_MIN), @(LONG_LONG_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testFailureMessageWithShortArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethodWithShort:SHRT_MIN andShort:SHRT_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World failed with arguments %@, %@.", @(SHRT_MIN), @(SHRT_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testFailureMessageWithUnsignedCharArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethodWithUnsignedChar:0 andUnsignedChar:UCHAR_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World failed with arguments 0, %@.", @(UCHAR_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testFailureMessageWithUnsignedIntArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethodWithUnsignedInt:0 andUnsignedInt:UINT_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World failed with arguments 0, %@.", @(UINT_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testFailureMessageWithUnsignedLongArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethodWithUnsignedLong:0 andUnsignedLong:ULONG_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World failed with arguments 0, %@.", @(ULONG_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testFailureMessageWithUnsignedLongLongArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethodWithUnsignedLongLong:0 andUnsignedLongLong:ULLONG_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World failed with arguments 0, %@.", @(ULONG_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's failure message.");
    }
}

- (void)testFailureMessageWithUnsignedShortArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation failureMethodWithUnsignedShort:0 andUnsignedShort:USHRT_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World failed with arguments 0, %@.", @(USHRT_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's failure message.");
    }
}

#pragma mark - Negative failure message

- (void)testNegativeFailureMessageWithNoArguments
{
    @try {
        PSTExpectation *expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [(id)expectation successfulMethod];
    }
    @catch(NSException *exception) {
        STAssertEqualObjects([exception reason], @"Hello World succeeded.", @"Exception reason did not match the matcher's negative failure message.");
    }
}


- (void)testNegativeFailureMessageWithNullArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [expectation successfulMethodWithNull:nil andNull:NULL];
    }
    @catch(NSException *exception) {
        STAssertEqualObjects([exception reason], @"Hello World succeeded with arguments <null>, <null>.", @"Exception reason did not match the matcher's negative failure message.");
    }
}

- (void)testNegativeFailureMessageWithObjectArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [expectation successfulMethodWithObject:@"Foo" andObject:@"Bar"];
    }
    @catch(NSException *exception) {
        STAssertEqualObjects([exception reason], @"Hello World succeeded with arguments Foo, Bar.", @"Exception reason did not match the matcher's negative failure message.");
    }
}

- (void)testNegativeFailureMessageWithClassArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [expectation successfulMethodWithClass:[NSObject class] andClass:[NSString class]];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World succeeded with arguments %@, %@.", [NSObject class], [NSString class]];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's negative failure message.");
    }
}

- (void)testNegativeFailureMessageWithSelectorArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [expectation successfulMethodWithSelector:@selector(one) andSelector:@selector(two)];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World succeeded with arguments %@, %@.", NSStringFromSelector(@selector(one)), NSStringFromSelector(@selector(two))];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's negative failure message.");
    }
}

- (void)testNegativeFailureMessageWithBooleanArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [expectation successfulMethodWithBoolean:true andBoolean:false];
    }
    @catch(NSException *exception) {
        STAssertEqualObjects([exception reason], @"Hello World succeeded with arguments 1, 0.", @"Exception reason did not match the matcher's negative failure message.");
    }
}

- (void)testNegativeFailureMessageWithCharArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [expectation successfulMethodWithChar:CHAR_MIN andChar:CHAR_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World succeeded with arguments %@, %@.", @(CHAR_MIN), @(CHAR_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's negative failure message.");
    }
}

- (void)testNegativeFailureMessageWithDoubleArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [expectation successfulMethodWithDouble:DBL_MIN andDouble:DBL_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World succeeded with arguments %@, %@.", @(DBL_MIN), @(DBL_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's negative failure message.");
    }
}

- (void)testNegativeFailureMessageWithFloatArgument
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [expectation successfulMethodWithFloat:FLT_MIN andFloat:FLT_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World succeeded with arguments %@, %@.", @(FLT_MIN), @(FLT_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's negative failure message.");
    }
}

- (void)testNegativeFailureMessageWithIntArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [expectation successfulMethodWithInt:INT_MIN andInt:INT_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World succeeded with arguments %@, %@.", @(INT_MIN), @(INT_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's negative failure message.");
    }
}

- (void)testNegativeFailureMessageWithLongArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [expectation successfulMethodWithLong:LONG_MIN andLong:LONG_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World succeeded with arguments %@, %@.", @(LONG_MIN), @(LONG_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's negative failure message.");
    }
}

- (void)testNegativeFailureMessageWithLongLongArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [expectation successfulMethodWithLongLong:LLONG_MIN andLongLong:LLONG_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World succeeded with arguments %@, %@.", @(LONG_LONG_MIN), @(LONG_LONG_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's negative failure message.");
    }
}

- (void)testNegativeFailureMessageWithShortArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [expectation successfulMethodWithShort:SHRT_MIN andShort:SHRT_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World succeeded with arguments %@, %@.", @(SHRT_MIN), @(SHRT_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's negative failure message.");
    }
}

- (void)testNegativeFailureMessageWithUnsignedCharArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [expectation successfulMethodWithUnsignedChar:0 andUnsignedChar:UCHAR_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World succeeded with arguments 0, %@.", @(UCHAR_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's negative failure message.");
    }
}

- (void)testNegativeFailureMessageWithUnsignedIntArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [expectation successfulMethodWithUnsignedInt:0 andUnsignedInt:UINT_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World succeeded with arguments 0, %@.", @(UINT_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's negative failure message.");
    }
}

- (void)testNegativeFailureMessageWithUnsignedLongArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation successfulMethodWithUnsignedLong:0 andUnsignedLong:ULONG_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World succeeded with arguments 0, %@.", @(ULONG_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's negative failure message.");
    }
}

- (void)testNegativeFailureMessageWithUnsignedLongLongArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [expectation successfulMethodWithUnsignedLongLong:0 andUnsignedLongLong:ULLONG_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World succeeded with arguments 0, %@.", @(ULONG_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's negative failure message.");
    }
}

- (void)testNegativeFailureMessageWithUnsignedShortArguments
{
    @try {
        id expectation = [[PSTExpectation alloc] initWithSubject:@"Hello World"];
        [expectation setNegative:YES];
        [expectation successfulMethodWithUnsignedShort:0 andUnsignedShort:USHRT_MAX];
    }
    @catch(NSException *exception) {
        NSString *message = [NSString stringWithFormat:@"Hello World succeeded with arguments 0, %@.", @(USHRT_MAX)];
        STAssertEqualObjects([exception reason], message, @"Exception reason did not match the matcher's negative failure message.");
    }
}

#pragma mark Category on NSObject

- (void)test_makeExpectationOnLine_InFile_ShouldCreatePositiveExpectation
{
    id object = [NSObject new];
    PSTExpectation *expectation = [object makeExpectationOnLine:@32 inFile:@"some file"];
    STAssertEqualObjects([expectation subject], object, @"Expectation subject was not the object that -makeExpectationInFile:onLine: was called on.");
    STAssertEqualObjects([expectation filePath], @"some file", @"Expected expectation to use the file given to -makeExpectationInFile:onLine:");
    STAssertEqualObjects([expectation lineNumber], @32, @"Expected expectation to use the line number given to -makeExpectationInFile:onLine:");
    STAssertFalse([expectation isNegative], @"Expectation should have been positive, but was negative.");
}

- (void)test_makeNegativeExpectationOnLine_InFile_ShouldNotCreateNegativeExpectation
{
    id object = [NSObject new];
    PSTExpectation *expectation = [object makeNegativeExpectationOnLine:@32 inFile:@"some file"];
    STAssertEqualObjects([expectation subject], object, @"Expectation subject was not the object that -makeNegativeExpectationInFile:onLine: was called on.");
    STAssertEqualObjects([expectation filePath], @"some file", @"Expected expectation to use the file given to -makeExpectationInFile:onLine:");
    STAssertEqualObjects([expectation lineNumber], @32, @"Expected expectation to use the line number given to -makeExpectationInFile:onLine:");
    STAssertTrue([expectation isNegative], @"Expectation should have been negative, but was positive.");
}

@end
