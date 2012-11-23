//
//  SHDShouldTests.h
//  Beehive
//
//  Created by Ryan Davies on 14/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "NSObject+SHDShould.h"
#import "SHDExpectation.h"

@interface SHDShouldTests : SenTestCase
@end

@implementation SHDShouldTests

- (void)testShouldCreatesPositiveExpectation
{
    id object = [NSObject new];
    SHDExpectation *expectation = [object should];
    STAssertEqualObjects([expectation subject], object, @"Expectation subject was not the object that -should was called on.");
    STAssertFalse([expectation isNegative], @"Expectation should have been positive, but was negative.");
}

- (void)testShouldNotCreatesNegativeExpectation
{
    id object = [NSObject new];
    SHDExpectation *expectation = [object shouldNot];
    STAssertEqualObjects([expectation subject], object, @"Expectation subject was not the object that -shouldNot was called on.");
    STAssertTrue([expectation isNegative], @"Expectation should have been negative, but was positive.");
}

@end
