//
//  PSTObjectTests.m
//  Posit
//
//  Created by Ryan Davies on 21/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "Posit.h"

@interface PSTObjectTests : SenTestCase
@end

@interface PSTTestSubject : NSObject
@end

@implementation PSTTestSubject
- (NSString *)description { return @"test subject"; }
@end

@implementation PSTObjectTests

- (void)setUp {}
- (void)tearDown {}

#pragma mark beEqualTo

- (void)test_BeEqualTo_SucceedsIfEqual
{
    STAssertNoThrow([[@"foo" should] beEqualTo:@"foo"], @"should not throw an exception");
}

- (void)test_BeEqualTo_FailsIfInequal
{
    PSTVerifyBlockRaisesExceptionWithReason(^{ [[@"foo" should] beEqualTo:@"bar"]; }, @"Expected foo to be equal to bar.");
}

- (void)test_BeEqualTo_Negative_SucceedsIfInequal
{
    STAssertNoThrow([[@"foo" shouldNot] beEqualTo:@"bar"], @"Should not throw an exception.");
}

- (void)test_BeEqualTo_Negative_FailsIfEqual
{
    PSTVerifyBlockRaisesExceptionWithReason(^{ [[@"foo" shouldNot] beEqualTo:@"foo"]; }, @"Expected foo not to be equal to foo.");
}

#pragma mark beIdenticalTo

- (void)test_BeIdenticalTo_SucceedsIfEqual
{
    id object = @"foo";
    STAssertNoThrow([[object should] beIdenticalTo:object], @"Expected expectation to succeed.");
}

- (void)test_BeIdenticalTo_FailsIfInequal
{
    PSTVerifyBlockRaisesExceptionWithReason(^{ [[@"foo" should] beIdenticalTo:@"bar"]; }, @"Expected foo to be identical to bar.");
}

- (void)test_BeIdenticalTo_Negative_SucceedsIfInequal
{
    STAssertNoThrow([[@"foo" shouldNot] beIdenticalTo:@"bar"], @"Expected expectation to fail.");
}

- (void)test_BeIdenticalTo_Negative_FailsIfEqual
{
    id object = @"foo";
    PSTVerifyBlockRaisesExceptionWithReason(^{ [[object shouldNot] beIdenticalTo:object]; }, @"Expected foo not to be identical to foo.");
}


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
    PSTVerifyBlockRaisesExceptionWithReason(^{ [[[PSTTestSubject new] should] beKindOfClass:[NSNumber class]]; }, @"Expected test subject to be kind of class NSNumber.");
}

- (void)test_shouldNot_beKindOfClass_FailsIfObjectIsOfSameClass
{
    PSTVerifyBlockRaisesExceptionWithReason(^{ [[[PSTTestSubject new] shouldNot] beKindOfClass:[PSTTestSubject class]]; }, @"Expected test subject not to be kind of class PSTTestSubject.");
}

- (void)test_shouldNot_beKindOfClass_FailsIfObjectInheritsFromClass
{
    PSTVerifyBlockRaisesExceptionWithReason(^{ [[[PSTTestSubject new] shouldNot] beKindOfClass:[NSObject class]]; }, @"Expected test subject not to be kind of class NSObject.");
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
    PSTVerifyBlockRaisesExceptionWithReason(^{ [[[PSTTestSubject new] should] beMemberOfClass:[NSObject class]]; }, @"Expected test subject to be member of class NSObject.");
}

- (void)test_should_beMemberOfClass_FailsIfObjectIsNotOfIdenticalClass
{
    PSTVerifyBlockRaisesExceptionWithReason(^{ [[[PSTTestSubject new] should] beMemberOfClass:[NSNumber class]]; }, @"Expected test subject to be member of class NSNumber.");
}

- (void)test_shouldNot_beMemberOfClass_FailsIfObjectIsOfSameClass
{
    PSTVerifyBlockRaisesExceptionWithReason(^{ [[[PSTTestSubject new] shouldNot] beMemberOfClass:[PSTTestSubject class]]; }, @"Expected test subject not to be member of class PSTTestSubject.");
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
