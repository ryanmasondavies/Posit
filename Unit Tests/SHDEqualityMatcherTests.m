//
//  SHDEqualityMatcherTests.m
//  Beehive
//
//  Created by Ryan Davies on 13/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "SHDExpectation.h"
#import "SHDEqualityMatcher.h"

@interface SHDEqualityMatcherTests : SenTestCase
@end

@implementation SHDEqualityMatcherTests

- (void)testDoesNotThrowExceptionIfEqual
{
    id expectation = [[SHDExpectation alloc] initWithSubject:@"foo"];
    STAssertNoThrow([expectation beEqualTo:@"foo"], @"Raised an exception, but should not have.");
}

- (void)testThrowsExceptionIfInequal
{
    id expectation = [[SHDExpectation alloc] initWithSubject:@"foo"];
    STAssertThrows([expectation beEqualTo:@"bar"], @"Did not raise an exception, but should have.");
}

@end
