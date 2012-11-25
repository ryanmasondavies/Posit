//
//  PSTBeMatcherTests.m
//  Posit
//
//  Created by Ryan Davies on 25/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "PSTBeMatcher.h"

@interface PSTTestSubject : NSObject
- (BOOL)isValid;
@end

@implementation PSTTestSubject
- (BOOL)isValid { return YES; }
@end

@interface PSTBeMatcher ()
- (BOOL)beValid;
@end

@interface PSTBeMatcherTests : SenTestCase
@end

@implementation PSTBeMatcherTests

- (void)testReturnsResultOfMethodStartingWith_Is_ForInvocationsBeginningWith_Be_
{
    PSTBeMatcher *matcher = [[PSTBeMatcher alloc] initWithSubject:[PSTTestSubject new]];
    STAssertTrue([matcher beValid], @"Matcher did not return the result of calling -isValid on the subject.");
}

- (void)testInstancesRespondToMethodsStartingWith_Be_
{
    STAssertTrue([PSTBeMatcher instancesRespondToSelector:@selector(beValid)], @"Matcher class did not report its instances as responding to a selector beginning with 'be'.");
}

- (void)testInstancesDoNotRespondToMethodsStartingWith_Be_AsPartOfAWord
{
    STAssertFalse([PSTBeMatcher instancesRespondToSelector:@selector(beingValid)], @"Matcher class reported its instances as responding to a selector beginning with 'be' as part of a word ('being').");
}

@end
