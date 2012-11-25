//
//  PSTEqualityTests.m
//  Posit
//
//  Created by Ryan Davies on 21/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "Posit.h"

@interface PSTEqualityTests : SenTestCase
@end

@implementation PSTEqualityTests

#pragma mark beEqualTo

- (void)test_BeEqualTo_SucceedsIfEqual
{
    STAssertNoThrow([[@"foo" should] beEqualTo:@"foo"], @"should not throw an exception");
}

- (void)test_BeEqualTo_FailsIfInequal
{
    NSException *exception = nil;
    @try { [[@"foo" should] beEqualTo:@"bar"]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertNotNil(exception, @"Should throw an exception");
    STAssertEqualObjects([exception reason], @"Expected foo to be equal to bar.", @"Expected the correct failure message.");
}

- (void)test_BeEqualTo_Negative_SucceedsIfInequal
{
    STAssertNoThrow([[@"foo" shouldNot] beEqualTo:@"bar"], @"Should not throw an exception.");
}

- (void)test_BeEqualTo_Negative_FailsIfEqual
{
    NSException *exception = nil;
    @try { [[@"foo" shouldNot] beEqualTo:@"foo"]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertNotNil(exception, @"Should throw an exception");
    STAssertEqualObjects([exception reason], @"Expected foo not to be equal to foo.", @"Expected the correct failure message.");
}

#pragma mark beIdenticalTo

- (void)test_BeIdenticalTo_SucceedsIfEqual
{
    id object = @"foo";
    STAssertNoThrow([[object should] beIdenticalTo:object], @"Expected expectation to succeed.");
}

- (void)test_BeIdenticalTo_FailsIfInequal
{
    NSException *exception = nil;
    @try { [[@"foo" should] beIdenticalTo:@"bar"]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertNotNil(exception, @"Should throw an exception");
    STAssertEqualObjects([exception reason], @"Expected foo to be identical to bar.", @"Expected the correct failure message.");
}

- (void)test_BeIdenticalTo_Negative_SucceedsIfInequal
{
    STAssertNoThrow([[@"foo" shouldNot] beIdenticalTo:@"bar"], @"Expected expectation to fail.");
}

- (void)test_BeIdenticalTo_Negative_FailsIfEqual
{
    NSException *exception = nil;
    id object = @"foo";
    @try { [[object shouldNot] beIdenticalTo:object]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertNotNil(exception, @"Should throw an exception");
    STAssertEqualObjects([exception reason], @"Expected foo not to be identical to foo.", @"Expected the correct failure message.");
}

@end
