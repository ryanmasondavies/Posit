//
//  PSTMatcherTests.m
//  Posit
//
//  Created by Ryan Davies on 25/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "PSTMatcher.h"

@interface PSTMatcherTests : SenTestCase
@end

@interface PSTSampleMatcher : PSTMatcher
- (BOOL)someMethod;
@end

@implementation PSTSampleMatcher
- (BOOL)someMethod { return NO; }
@end

@implementation PSTMatcherTests

- (void)test_SubclassWhoseInstancesRespondToSelector_ToReturnSubclassThatRespondsToASelector
{
    STAssertTrue([PSTMatcher subclassWhoseInstancesRespondToSelector:@selector(someMethod)] == [PSTSampleMatcher class], @"Expected PSTMatcher to return PSTSampleMatcher as a subclass that responds to -someMethod.");
}

@end
