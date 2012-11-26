//
//  PSTKindTests.m
//  Posit
//
//  Created by Ryan Davies on 26/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "Posit.h"

@interface PSTKindTests : SenTestCase
@end

@interface PSTTestSubject : NSObject
@end

@implementation PSTTestSubject
- (NSString *)description { return @"test subject"; }
@end

@implementation PSTKindTests

#pragma mark beKindOfClass

- (void)test_should_beKindOfClass_SucceedsIfObjectIsOfSameClass
{
    STAssertNoThrow([[[PSTTestSubject new] should] beKindOfClass:[PSTTestSubject class]], @"Expected statement not to throw an exception.");
}

- (void)test_should_beKindOfClass_SucceedsIfObjectInheritsFromClass
{
    STAssertNoThrow([[[PSTTestSubject new] should] beKindOfClass:[NSObject class]], @"Expected statement not to throw an exception.");
}

- (void)test_should_beKindOfClass_FailsIfObjectDoesNotInheritFromClass
{
    NSException *exception = nil;
    @try { [[[PSTTestSubject new] should] beKindOfClass:[NSNumber class]]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertNotNil(exception, @"Expected statement to throw an exception.");
    STAssertEqualObjects([exception reason], @"Expected test subject to be kind of class NSNumber.", @"Expected the correct failure message.");
}

- (void)test_shouldNot_beKindOfClass_FailsIfObjectIsOfSameClass
{
    NSException *exception = nil;
    @try { [[[PSTTestSubject new] shouldNot] beKindOfClass:[PSTTestSubject class]]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertNotNil(exception, @"Expected statement to throw an exception.");
    STAssertEqualObjects([exception reason], @"Expected test subject not to be kind of class PSTTestSubject.", @"Expected the correct failure message.");
}

- (void)test_shouldNot_beKindOfClass_FailsIfObjectInheritsFromClass
{
    NSException *exception = nil;
    @try { [[[PSTTestSubject new] shouldNot] beKindOfClass:[NSObject class]]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertNotNil(exception, @"Expected statement to throw an exception.");
    STAssertEqualObjects([exception reason], @"Expected test subject not to be kind of class NSObject.", @"Expected the correct failure message.");
}

- (void)test_shouldNot_beKindOfClass_SucceedsIfObjectDoesNotInheritFromClass
{
    STAssertNoThrow([[[PSTTestSubject new] shouldNot] beKindOfClass:[NSNumber class]], @"Expected statement not to throw an exception.");
}

#pragma mark beMemberOfClass

- (void)test_should_beMemberOfClass_SucceedsIfObjectIsOfIdenticalClass
{
    STAssertNoThrow([[[PSTTestSubject new] should] beMemberOfClass:[PSTTestSubject class]], @"Expected statement not to throw an exception.");
}

- (void)test_should_beMemberOfClass_FailsIfObjectInheritsFromClass
{
    NSException *exception = nil;
    @try { [[[PSTTestSubject new] should] beMemberOfClass:[NSObject class]]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertNotNil(exception, @"Expected statement to throw an exception.");
    STAssertEqualObjects([exception reason], @"Expected test subject to be member of class NSObject.", @"Expected the correct failure message.");
}

- (void)test_should_beMemberOfClass_FailsIfObjectIsNotOfIdenticalClass
{
    NSException *exception = nil;
    @try { [[[PSTTestSubject new] should] beMemberOfClass:[NSNumber class]]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertNotNil(exception, @"Expected statement to throw an exception.");
    STAssertEqualObjects([exception reason], @"Expected test subject to be member of class NSNumber.", @"Expected the correct failure message.");
}

- (void)test_shouldNot_beMemberOfClass_FailsIfObjectIsOfSameClass
{
    NSException *exception = nil;
    @try { [[[PSTTestSubject new] shouldNot] beMemberOfClass:[PSTTestSubject class]]; }
    @catch(NSException *e) { exception = e; }
    
    STAssertNotNil(exception, @"Expected statement to throw an exception.");
    STAssertEqualObjects([exception reason], @"Expected test subject not to be member of class PSTTestSubject.", @"Expected the correct failure message.");
}

- (void)test_shouldNot_beMemberOfClass_SucceedsIfObjectInheritsFromClass
{
    STAssertNoThrow([[[PSTTestSubject new] shouldNot] beMemberOfClass:[NSObject class]], @"Expected statement not to throw an exception.");
}

- (void)test_shouldNot_beMemberOfclass_SucceedsIfObjectIsNotOfSameClass
{
    STAssertNoThrow([[[PSTTestSubject new] shouldNot] beMemberOfClass:[NSNumber class]], @"Expected statement not to throw an exception.");
}

@end
