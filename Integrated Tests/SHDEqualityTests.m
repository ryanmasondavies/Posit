//
//  SHDEqualityTests.m
//  Should
//
//  Created by Ryan Davies on 21/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "Should.h"

@interface SHDEqualityTests : SenTestCase
@end

@implementation SHDEqualityTests

- (void)testSucceedsIfEqual
{
    STAssertNoThrow([[@"foo" should] beEqualTo:@"foo"], @"should not throw an exception");
}

- (void)testFailsIfInequal
{
    NSException *exception = nil;
    @try { [[@"foo" should] beEqualTo:@"bar"]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertNotNil(exception, @"Should throw an exception");
    STAssertEqualObjects([exception reason], @"foo should have been equal to bar.", @"Should have had the correct failure message");
}

- (void)testNegative_SucceedsIfInequal
{
    STAssertNoThrow([[@"foo" shouldNot] beEqualTo:@"bar"], @"Should not throw an exception.");
}

- (void)testNegative_FailsIfEqual
{
    NSException *exception = nil;
    @try { [[@"foo" shouldNot] beEqualTo:@"foo"]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertNotNil(exception, @"Should throw an exception");
    STAssertEqualObjects([exception reason], @"foo should not have been equal to foo.", @"Should have had the correct failure message");
}

@end
