//
//  NSObject+PSTShould.m
//  Beehive
//
//  Created by Ryan Davies on 14/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "NSObject+PSTShould.h"
#import "PSTExpectation.h"

@implementation NSObject (PSTShould)

- (id)should
{
    return [[PSTExpectation alloc] initWithSubject:self];
}

- (id)shouldNot
{
    PSTExpectation *expectation = [[PSTExpectation alloc] initWithSubject:self];
    [expectation setNegative:YES];
    return expectation;
}

@end
