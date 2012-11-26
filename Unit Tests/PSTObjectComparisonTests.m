//
//  PSTObjectComparisonTests.m
//  Posit
//
//  Created by Ryan Davies on 25/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "PSTObjectComparison.h"

@interface PSTObjectComparisonTests : SenTestCase
@end

@interface PSTObject : NSObject
@property (nonatomic, getter=wasIsEqualCalled) BOOL isEqualCalled;
@property (nonatomic, getter=wasIsIdenticalCalled) BOOL isIdenticalCalled;
@end

@implementation PSTObject

- (BOOL)isEqual:(id)object
{
    self.isEqualCalled = YES;
    return YES;
}

- (BOOL)isIdentical:(id)object
{
    self.isIdenticalCalled = YES;
    return YES;
}

@end

@implementation PSTObjectComparisonTests

- (void)test_IsIdentical_ReturnsTrueForIdenticalObjects
{
    NSObject *object = [NSObject new];
    STAssertTrue([object isIdentical:object], @"Expected isIdentical: to return true for the same instance.");
}

- (void)test_IsIdentical_ReturnsFalseForDifferentObjects
{
    STAssertFalse([[NSObject new] isIdentical:[NSObject new]], @"Expected isIdentical: to return false for two different instances.");
}

- (void)test_IsEqualTo_AliasesTo_IsEqual
{
    PSTObject *object = [PSTObject new];
    STAssertTrue([object isEqualTo:[NSObject new]], @"Expected isEqualTo: to return true, indicating that it was used as the return value.");
    STAssertTrue([object wasIsEqualCalled], @"Expected isEqual: to have been called when isEqualTo: was invoked.");
}

- (void)test_IsIdenticalTo_AliasesTo_IsIdentical
{
    PSTObject *object = [PSTObject new];
    STAssertTrue([object isIdenticalTo:[NSObject new]], @"Expected isIdenticalTo: to return true, indicating that it was used as the return value.");
    STAssertTrue([object wasIsIdenticalCalled], @"Expected isIdentical: to have been called when isIdenticalTo: was invoked.");
}

@end
