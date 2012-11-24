//
//  PSTMatcher.m
//  Beehive
//
//  Created by Ryan Davies on 14/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "PSTMatcher.h"
#import "PSTMatcherRegistry.h"

@implementation PSTMatcher

- (id)initWithSubject:(id)subject
{
    if (self = [super init])
        self.subject = subject;
    
    return self;
}

- (NSString *)failureMessageForSelector:(SEL)selector arguments:(NSArray *)arguments
{
    return nil;
}

- (NSString *)negativeFailureMessageForSelector:(SEL)selector arguments:(NSArray *)arguments
{
    return nil;
}

@end
