//
//  PSTExpectationMaker.m
//  Posit
//
//  Created by Ryan Davies on 01/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "PSTExpectationMaker.h"
#import <SenTestingKit/SenTestingKit.h>
#import "PSTExpectation.h"
#import "PSTInversionFilter.h"
#import "PSTEqualityMatcher.h"

@interface PSTExpectationMaker ()
@property (strong, nonatomic) id subject;
@property (assign, nonatomic, getter = isInverted) BOOL inverted;
@end

@implementation PSTExpectationMaker

- (id)initWithSubject:(id)subject
{
    if (self = [self init]) {
        self.subject = subject;
    }
    return self;
}

- (id)to
{
    return self;
}

- (id)notTo
{
    [self setInverted:YES];
    return self;
}

- (void)beEqualTo:(id)other
{
    id matcher = [[PSTEqualityMatcher alloc] initWithExpected:other];
    if ([self isInverted]) matcher = [[PSTInversionFilter alloc] initWithMatcher:matcher];
    NSString *reason;
    if ([self isInverted]) {
        reason = [NSString stringWithFormat:@"Expected '%@' not to be equal to '%@'.", [self subject], other];
    } else {
        reason = [NSString stringWithFormat:@"Expected '%@' to be equal to '%@'.", [self subject], other];
    }
    NSException *exception = [[NSException alloc] initWithName:SenTestFailureException reason:reason userInfo:@{SenTestFilenameKey: @(__FILE__), SenTestLineNumberKey: @(__LINE__)}];
    PSTExpectation *expectation = [[PSTExpectation alloc] initWithSubject:[self subject] matcher:matcher exception:exception];
    [expectation verify];
}

@end
