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

- (void)testShouldCreatesExpectation
{
    id object = [NSObject new];
    SHDExpectation *expectation = [object should];
    STAssertEqualObjects([expectation subject], object, @"Expectation subject was not the object that -should was called on.");
}

@end
