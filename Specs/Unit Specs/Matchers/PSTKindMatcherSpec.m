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

#import "PSTElephant.h"
#import "PSTPanda.h"

SpecBegin(PSTKindMatcher)

__block id<PSTMatcher> matcher;

when(@"Comparing to PSTMammal", ^{
    before(^{
        matcher = [[PSTKindMatcher alloc] initWithClass:[PSTMammal class]];
    });
    
    it(@"matches an instance of PSTElephant", ^{
        PSTElephant *elephant = [[PSTElephant alloc] init];
        STAssertTrue([matcher matches:elephant], @"");
    });
    
    it(@"matches an instance of PSTMammal", ^{
        PSTMammal *mammal = [[PSTMammal alloc] init];
        STAssertTrue([matcher matches:mammal], @"");
    });
    
    it(@"matches an instance of PSTPanda", ^{
        PSTPanda *panda = [[PSTPanda alloc] init];
        STAssertTrue([matcher matches:panda], @"");
    });
});

when(@"Comparing to PSTElephant", ^{
    before(^{
        matcher = [[PSTKindMatcher alloc] initWithClass:[PSTElephant class]];
    });
    
    it(@"matches an instance of PSTElephant", ^{
        PSTElephant *elephant = [[PSTElephant alloc] init];
        STAssertTrue([matcher matches:elephant], @"");
    });
    
    it(@"does not match an instance of PSTPanda", ^{
        PSTPanda *panda = [[PSTPanda alloc] init];
        STAssertFalse([matcher matches:panda], @"");
    });
    
    it(@"does not match an instance of PSTMammal", ^{
        PSTMammal *mammal = [[PSTMammal alloc] init];
        STAssertFalse([matcher matches:mammal], @"");
    });
});

when(@"Comparing to PSTPanda", ^{
    before(^{
        matcher = [[PSTKindMatcher alloc] initWithClass:[PSTPanda class]];
    });
    
    it(@"matches an instance of PSTPanda", ^{
        PSTPanda *panda = [[PSTPanda alloc] init];
        STAssertTrue([matcher matches:panda], @"");
    });
    
    it(@"does not match an instance of PSTMammal", ^{
        PSTMammal *mammal = [[PSTMammal alloc] init];
        STAssertFalse([matcher matches:mammal], @"");
    });
    
    it(@"does not match an instance of PSTElephant", ^{
        PSTElephant *elephant = [[PSTElephant alloc] init];
        STAssertFalse([matcher matches:elephant], @"");
    });
});

SpecEnd
