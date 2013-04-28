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

SpecBegin(PSTAndFilter)

__block id<PSTMatcher> filter;

when(@"All matchers match", ^{
    before(^{
        NSMutableArray *matchers = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < 10; i ++) {
            matchers[i] = [[PSTEqualityMatcher alloc] initWithExpected:@TRUE];
        }
        filter = [[PSTAndFilter alloc] initWithMatchers:matchers];
    });
    
    it(@"matches", ^{
        STAssertTrue([filter matches:@TRUE], nil);
    });
});

when(@"All but one matchers match", ^{
    before(^{
        NSMutableArray *matchers = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < 10; i ++) {
            matchers[i] = [[PSTEqualityMatcher alloc] initWithExpected:@TRUE];
        }
        matchers[5] = [[PSTEqualityMatcher alloc] initWithExpected:@FALSE];
        filter = [[PSTAndFilter alloc] initWithMatchers:matchers];
    });
    
    it(@"does not match", ^{
        STAssertFalse([filter matches:@TRUE], nil);
    });
});

when(@"All matchers do not match", ^{
    before(^{
        NSMutableArray *matchers = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < 10; i ++) {
            matchers[i] = [[PSTEqualityMatcher alloc] initWithExpected:@FALSE];
        }
        filter = [[PSTAndFilter alloc] initWithMatchers:matchers];
    });
    
    it(@"does not match", ^{
        STAssertFalse([filter matches:@TRUE], nil);
    });
});

SpecEnd
