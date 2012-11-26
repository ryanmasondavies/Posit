//
//  PSTNumberComparison.m
//  Posit
//
//  Created by Ryan Davies on 26/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "PSTNumberComparison.h"

@implementation NSNumber (PSTNumberComparison)

- (BOOL)isZero
{
    return [self isEqualToNumber:@0];
}

- (BOOL)isPositive
{
    return [self compare:@0] == NSOrderedDescending;
}

- (BOOL)isNegative
{
    return [self compare:@0] == NSOrderedAscending;
}

- (BOOL)isGreaterThan:(NSNumber *)number
{
    return [number compare:self] == NSOrderedAscending;
}

- (BOOL)isLessThan:(NSNumber *)number
{
    return [number compare:self] == NSOrderedDescending;
}

- (BOOL)isGreaterThanOrEqualTo:(NSNumber *)number
{
    return [number compare:self] != NSOrderedDescending;
}

- (BOOL)isLessThanOrEqualTo:(NSNumber *)number
{
    return [number compare:self] != NSOrderedAscending;
}

- (BOOL)isBetween:(NSNumber *)start and:(NSNumber *)end
{
    return [self isGreaterThanOrEqualTo:start] && [self isLessThanOrEqualTo:end];
}

@end
