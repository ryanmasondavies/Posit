//
//  SHDEqualityMatcherTests.m
//  Beehive
//
//  Created by Ryan Davies on 13/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "SHDEqualityMatcher.h"

@interface SHDEqualityMatcherTests : SenTestCase
@end

@implementation SHDEqualityMatcherTests

- (void)testReturnsTrueIfEqual
{
    SHDEqualityMatcher *matcher = [[SHDEqualityMatcher alloc] initWithSubject:@"foo"];
    STAssertTrue([matcher beEqualTo:@"foo"], @"Matcher should have returned true.");
}

- (void)testReturnsFalseIfInequal
{
    SHDEqualityMatcher *matcher = [[SHDEqualityMatcher alloc] initWithSubject:@"foo"];
    STAssertFalse([matcher beEqualTo:@"bar"], @"Matcher should have returned false.");
}

- (void)testFailureMessage
{
    SHDEqualityMatcher *matcher = [[SHDEqualityMatcher alloc] initWithSubject:@"foo"];
    NSString *message = [matcher failureMessageForSelector:@selector(beEqualTo:) arguments:@[@"bar"]];
    STAssertEqualObjects(message, @"foo should have been equal to bar.", @"Failure message was not as expected.");
}

- (void)testNegativeFailureMessage
{
    SHDEqualityMatcher *matcher = [[SHDEqualityMatcher alloc] initWithSubject:@"foo"];
    NSString *message = [matcher negativeFailureMessageForSelector:@selector(beEqualTo:) arguments:@[@"foo"]];
    STAssertEqualObjects(message, @"foo should not have been equal to foo.", @"Negative failure message was not as expected.");
}

@end
