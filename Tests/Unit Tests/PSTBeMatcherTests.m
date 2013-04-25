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

#import "PSTTestSubject.h"

@interface PSTBeMatcher ()
- (BOOL)beValid;
- (BOOL)beMember;
@end

@interface PSTBeMatcherTests : SenTestCase
@end

@implementation PSTBeMatcherTests

#pragma mark Responding to selectors

- (void)testInstancesRespondToMethodsStartingWith_Be_
{
    STAssertTrue([PSTBeMatcher instancesRespondToSelector:@selector(beValid)], @"Matcher class did not report its instances as responding to a selector beginning with 'be'.");
}

- (void)testInstancesDoNotRespondToMethodsStartingWith_Be_AsPartOfAWord
{
    STAssertFalse([PSTBeMatcher instancesRespondToSelector:@selector(beingValid)], @"Matcher class reported its instances as responding to a selector beginning with 'be' as part of a word ('being').");
}

#pragma mark Forwarding messages to the subject

- (void)testReturnsResultOfMethodStartingWith_Is_ForInvocationsBeginningWith_Be_
{
    PSTBeMatcher *matcher = [[PSTBeMatcher alloc] initWithSubject:[PSTTestSubject new]];
    STAssertTrue([matcher beValid], @"Matcher did not return the result of calling -isValid on the subject.");
}

- (void)testReturnsResultOfMethodStartingWith_Is_ForInvocationsBeginningWithAndContaining_Be_
{
    PSTBeMatcher *matcher = [[PSTBeMatcher alloc] initWithSubject:[PSTTestSubject new]];
    STAssertTrue([matcher beMember], @"Matcher did not return the result of calling -isMember on the subject.");
}

#pragma mark Generating failure messages

- (void)testGeneratesFailureMessagesWithASingleWord
{
    PSTBeMatcher *matcher = [[PSTBeMatcher alloc] initWithSubject:[PSTTestSubject new]];
    NSString *expected = @"Expected test subject to be valid.";
    STAssertEqualObjects([matcher failureMessageForSelector:@selector(beValid) arguments:@[]], expected, @"Failure message was not as expected.");
}

- (void)testGeneratesFailureMessagesWithMultipleWords
{
    PSTBeMatcher *matcher = [[PSTBeMatcher alloc] initWithSubject:[PSTTestSubject new]];
    NSString *expected = @"Expected test subject to be valid and wordy.";
    STAssertEqualObjects([matcher failureMessageForSelector:@selector(beValidAndWordy) arguments:@[]], expected, @"Failure message was not as expected.");
}

- (void)testGeneratesFailureMessagesWithASingleArgument
{
    PSTBeMatcher *matcher = [[PSTBeMatcher alloc] initWithSubject:[PSTTestSubject new]];
    NSString *expected = @"Expected test subject to be valid with this thing.";
    STAssertEqualObjects([matcher failureMessageForSelector:@selector(beValidWith:) arguments:@[@"this thing"]], expected, @"Failure message was not as expected.");
}

- (void)testGeneratesFailureMessagesWithMultipleArguments
{
    PSTBeMatcher *matcher = [[PSTBeMatcher alloc] initWithSubject:[PSTTestSubject new]];
    NSString *expected = @"Expected test subject to be valid with this thing and wordy against another thing.";
    NSString *actual = [matcher failureMessageForSelector:@selector(beValidWith:wordyAgainst:) arguments:@[@"this thing", @"another thing"]];
    STAssertEqualObjects(actual, expected, @"Failure message was not as expected.");
}

- (void)testGeneratesFailureMessagesWithArgumentsStartingWithAnd
{
    PSTBeMatcher *matcher = [[PSTBeMatcher alloc] initWithSubject:[PSTTestSubject new]];
    NSString *expected = @"Expected test subject to be valid with this thing and wordy against another thing.";
    NSString *actual = [matcher failureMessageForSelector:@selector(beValidWith:andWordyAgainst:) arguments:@[@"this thing", @"another thing"]];
    STAssertEqualObjects(actual, expected, @"Failure message was not as expected.");
}

- (void)testGeneratesFailureMessagesWhenSelectorContainsMultipleOccurrencesOf_To_
{
    PSTBeMatcher *matcher = [[PSTBeMatcher alloc] initWithSubject:[PSTTestSubject new]];
    NSString *expected = @"Expected test subject to be equal to this thing.";
    NSString *actual = [matcher failureMessageForSelector:@selector(beEqualTo:) arguments:@[@"this thing"]];
    STAssertEqualObjects(actual, expected, @"Failure message was not as expected.");
}

#pragma mark Generating negative failure messages

- (void)testGeneratesNegativeFailureMessagesWithASingleWord
{
    PSTBeMatcher *matcher = [[PSTBeMatcher alloc] initWithSubject:[PSTTestSubject new]];
    NSString *expected = @"Expected test subject not to be valid.";
    STAssertEqualObjects([matcher negativeFailureMessageForSelector:@selector(beValid) arguments:@[]], expected, @"Failure message was not as expected.");
}

- (void)testGeneratesNegativeFailureMessagesWithMultipleWords
{
    PSTBeMatcher *matcher = [[PSTBeMatcher alloc] initWithSubject:[PSTTestSubject new]];
    NSString *expected = @"Expected test subject not to be valid and wordy.";
    STAssertEqualObjects([matcher negativeFailureMessageForSelector:@selector(beValidAndWordy) arguments:@[]], expected, @"Failure message was not as expected.");
}

- (void)testGeneratesNegativeFailureMessagesWithASingleArgument
{
    PSTBeMatcher *matcher = [[PSTBeMatcher alloc] initWithSubject:[PSTTestSubject new]];
    NSString *expected = @"Expected test subject not to be valid with this thing.";
    STAssertEqualObjects([matcher negativeFailureMessageForSelector:@selector(beValidWith:) arguments:@[@"this thing"]], expected, @"Failure message was not as expected.");
}

- (void)testGeneratesNegativeFailureMessagesWithMultipleArguments
{
    PSTBeMatcher *matcher = [[PSTBeMatcher alloc] initWithSubject:[PSTTestSubject new]];
    NSString *expected = @"Expected test subject not to be valid with this thing and wordy against another thing.";
    NSString *actual = [matcher negativeFailureMessageForSelector:@selector(beValidWith:wordyAgainst:) arguments:@[@"this thing", @"another thing"]];
    STAssertEqualObjects(actual, expected, @"Failure message was not as expected.");
}

- (void)testGeneratesNegativeFailureMessagesWithArgumentsStartingWithAnd
{
    PSTBeMatcher *matcher = [[PSTBeMatcher alloc] initWithSubject:[PSTTestSubject new]];
    NSString *expected = @"Expected test subject not to be valid with this thing and wordy against another thing.";
    NSString *actual = [matcher negativeFailureMessageForSelector:@selector(beValidWith:andWordyAgainst:) arguments:@[@"this thing", @"another thing"]];
    STAssertEqualObjects(actual, expected, @"Failure message was not as expected.");
}

- (void)testGeneratesNegativeFailureMessagesWhenSelectorContainsMultipleOccurrencesOf_To_
{
    PSTBeMatcher *matcher = [[PSTBeMatcher alloc] initWithSubject:[PSTTestSubject new]];
    NSString *expected = @"Expected test subject not to be equal to this thing.";
    NSString *actual = [matcher negativeFailureMessageForSelector:@selector(beEqualTo:) arguments:@[@"this thing"]];
    STAssertEqualObjects(actual, expected, @"Failure message was not as expected.");
}

@end
