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

SpecBegin(PSTAllFilter)

__block id<PSTMatcher> filter;

NSMutableArray *(^equalityMatchers)(NSUInteger, id) = ^(NSUInteger count, id expected) {
    NSMutableArray *matchers = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < count; i ++) {
        matchers[i] = [[PSTEqualityMatcher alloc] initWithExpected:expected];
    }
    return matchers;
};

when(@"All matchers match", ^{
    before(^{
        NSMutableArray *matchers = equalityMatchers(10, @TRUE);
        filter = [[PSTAllFilter alloc] initWithMatchers:matchers];
    });
    
    it(@"matches", ^{
        STAssertTrue([filter matches:@TRUE], nil);
    });
});

when(@"Not all matchers match", ^{
    before(^{
        NSMutableArray *matchers = equalityMatchers(10, @TRUE);
        matchers[5] = [[PSTEqualityMatcher alloc] initWithExpected:@FALSE];
        filter = [[PSTAllFilter alloc] initWithMatchers:matchers];
    });
    
    it(@"does not match", ^{
        STAssertFalse([filter matches:@TRUE], nil);
    });
});

when(@"No matchers match", ^{
    before(^{
        NSMutableArray *matchers = equalityMatchers(10, @FALSE);
        filter = [[PSTAllFilter alloc] initWithMatchers:matchers];
    });
    
    it(@"does not match", ^{
        STAssertFalse([filter matches:@TRUE], nil);
    });
});

SpecEnd
