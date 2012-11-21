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
    STAssertThrows([[@"foo" should] beEqualTo:@"bar"], @"should throw an exception");
}

@end
