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
