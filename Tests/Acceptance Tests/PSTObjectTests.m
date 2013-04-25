// The MIT License
// 
// Copyright (c) 2013 Ryan Davies
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "PSTTestSubject.h"

@interface PSTObjectTests : SenTestCase
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
    PSTVerifyBlockRaisesExceptionWithReason([[@"foo" should] beEqualTo:@"bar"], @"Expected foo to be equal to bar.");
}

- (void)test_BeEqualTo_Negative_SucceedsIfInequal
{
    STAssertNoThrow([[@"foo" shouldNot] beEqualTo:@"bar"], @"Should not throw an exception.");
}

- (void)test_BeEqualTo_Negative_FailsIfEqual
{
    PSTVerifyBlockRaisesExceptionWithReason([[@"foo" shouldNot] beEqualTo:@"foo"], @"Expected foo not to be equal to foo.");
}

#pragma mark beIdenticalTo

- (void)test_BeIdenticalTo_SucceedsIfEqual
{
    id object = @"foo";
    STAssertNoThrow([[object should] beIdenticalTo:object], @"Expected expectation to succeed.");
}

- (void)test_BeIdenticalTo_FailsIfInequal
{
    PSTVerifyBlockRaisesExceptionWithReason([[@"foo" should] beIdenticalTo:@"bar"], @"Expected foo to be identical to bar.");
}

- (void)test_BeIdenticalTo_Negative_SucceedsIfInequal
{
    STAssertNoThrow([[@"foo" shouldNot] beIdenticalTo:@"bar"], @"Expected expectation to fail.");
}

- (void)test_BeIdenticalTo_Negative_FailsIfEqual
{
    id object = @"foo";
    PSTVerifyBlockRaisesExceptionWithReason([[object shouldNot] beIdenticalTo:object], @"Expected foo not to be identical to foo.");
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
    PSTVerifyBlockRaisesExceptionWithReason([[[PSTTestSubject new] should] beKindOfClass:[NSNumber class]], @"Expected test subject to be kind of class NSNumber.");
}

- (void)test_shouldNot_beKindOfClass_FailsIfObjectIsOfSameClass
{
    PSTVerifyBlockRaisesExceptionWithReason([[[PSTTestSubject new] shouldNot] beKindOfClass:[PSTTestSubject class]], @"Expected test subject not to be kind of class PSTTestSubject.");
}

- (void)test_shouldNot_beKindOfClass_FailsIfObjectInheritsFromClass
{
    PSTVerifyBlockRaisesExceptionWithReason([[[PSTTestSubject new] shouldNot] beKindOfClass:[NSObject class]], @"Expected test subject not to be kind of class NSObject.");
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
    PSTVerifyBlockRaisesExceptionWithReason([[[PSTTestSubject new] should] beMemberOfClass:[NSObject class]], @"Expected test subject to be member of class NSObject.");
}

- (void)test_should_beMemberOfClass_FailsIfObjectIsNotOfIdenticalClass
{
    PSTVerifyBlockRaisesExceptionWithReason([[[PSTTestSubject new] should] beMemberOfClass:[NSNumber class]], @"Expected test subject to be member of class NSNumber.");
}

- (void)test_shouldNot_beMemberOfClass_FailsIfObjectIsOfSameClass
{
    PSTVerifyBlockRaisesExceptionWithReason([[[PSTTestSubject new] shouldNot] beMemberOfClass:[PSTTestSubject class]], @"Expected test subject not to be member of class PSTTestSubject.");
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
