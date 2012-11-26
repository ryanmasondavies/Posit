//
//  PSTBooleanComparison.m
//  Posit
//
//  Created by Ryan Davies on 26/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "PSTBooleanComparison.h"

@implementation NSNumber (PSTBooleanComparison)

- (BOOL)isTrue
{
    return [self boolValue] == TRUE;
}

- (BOOL)isFalse
{
    return [self boolValue] == FALSE;
}

@end
