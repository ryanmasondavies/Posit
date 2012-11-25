//
//  NSObject+PSTEquality.m
//  Posit
//
//  Created by Ryan Davies on 25/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "NSObject+PSTEquality.h"

@implementation NSObject (PSTEquality)

- (BOOL)isIdentical:(id)object
{
    return (self == object);
}

- (BOOL)isEqualTo:(id)object
{
    return [self isEqual:object];
}

- (BOOL)isIdenticalTo:(id)object
{
    return [self isIdentical:object];
}

@end
