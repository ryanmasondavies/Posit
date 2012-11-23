//
//  NSObject+SHDShould.m
//  Beehive
//
//  Created by Ryan Davies on 14/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "NSObject+SHDShould.h"
#import "SHDExpectation.h"

@implementation NSObject (SHDShould)

- (id)should
{
    return [[SHDExpectation alloc] initWithSubject:self];
}

- (id)shouldNot
{
    SHDExpectation *expectation = [[SHDExpectation alloc] initWithSubject:self];
    [expectation setNegative:YES];
    return expectation;
}

@end
