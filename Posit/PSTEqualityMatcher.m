//
//  PSTEqualityMatcher.m
//  Beehive
//
//  Created by Ryan Davies on 14/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "PSTEqualityMatcher.h"
#import "PSTMatcherRegistry.h"

@implementation PSTEqualityMatcher

- (BOOL)beEqualTo:(id)object
{
    return [[self subject] isEqual:object];
}

- (NSString *)failureMessageForSelector:(SEL)selector arguments:(NSArray *)arguments
{
    return [NSString stringWithFormat:@"%@ should have been equal to %@.", [self subject], arguments[0]];
}

- (NSString *)negativeFailureMessageForSelector:(SEL)selector arguments:(NSArray *)arguments
{
    return [NSString stringWithFormat:@"%@ should not have been equal to %@.", [self subject], arguments[0]];
}

@end
