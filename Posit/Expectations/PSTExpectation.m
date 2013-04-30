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

#import "PSTExpectation.h"
#import <SenTestingKit/SenTestingKit.h>
#import "PSTMatcher.h"
#import "PSTEqualityMatcher.h"
#import "PSTInversionFilter.h"

@interface PSTExpectation ()
@property (strong, nonatomic) id subject;
@end

@implementation PSTExpectation

- (id)initWithSubject:(id)subject
{
    if (self = [self init]) {
        [self setSubject:subject];
    }
    return self;
}

- (void)apply:(id<PSTMatcher>)matcher exception:(NSException *)exception
{
    if ([matcher matches:[self subject]] == NO) {
        [exception raise];
    }
}

- (void)toBeEqualTo:(id)object
{
    id matcher = [[PSTEqualityMatcher alloc] initWithExpected:object];
    NSString *reason = [NSString stringWithFormat:@"Expected %@ to be equal to %@.", [self subject], object];
    NSException *exception = [[NSException alloc] initWithName:SenTestFailureException reason:reason userInfo:@{SenTestFilenameKey: @(__FILE__), SenTestLineNumberKey: @(__LINE__)}];
    [self apply:matcher exception:exception];
}

- (void)notToBeEqualTo:(id)object
{
    id matcher = [[PSTEqualityMatcher alloc] initWithExpected:object];
    matcher = [[PSTInversionFilter alloc] initWithMatcher:matcher];
    NSString *reason = [NSString stringWithFormat:@"Expected %@ not to be equal to %@.", [self subject], object];
    NSException *exception = [[NSException alloc] initWithName:SenTestFailureException reason:reason userInfo:@{SenTestFilenameKey: @(__FILE__), SenTestLineNumberKey: @(__LINE__)}];
    [self apply:matcher exception:exception];
}

@end