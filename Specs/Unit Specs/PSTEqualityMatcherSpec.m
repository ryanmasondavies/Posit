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

SpecBegin(PSTEqualityMatcher)

__block id<PSTMatcher> matcher;

when(@"Equating to true", ^{
    before(^{
        matcher = [[PSTEqualityMatcher alloc] initWithExpected:@TRUE];
    });
    
    it(@"matches true", ^{
        STAssertTrue([matcher matches:@TRUE], @"");
    });
    
    it(@"does not match false", ^{
        STAssertFalse([matcher matches:@FALSE], @"");
    });
});

when(@"Equating to 'Foobar'", ^{
    before(^{
        matcher = [[PSTEqualityMatcher alloc] initWithExpected:@"Foobar"];
    });
    
    it(@"matches 'Foobar'", ^{
        STAssertTrue([matcher matches:@"Foobar"], @"");
    });
    
    it(@"does not match 'Barfoo'", ^{
        STAssertFalse([matcher matches:@"Barfoo"], @"");
    });
});

when(@"Equating to 20", ^{
    before(^{
        matcher = [[PSTEqualityMatcher alloc] initWithExpected:@20];
    });
    
    it(@"matches 20", ^{
        STAssertTrue([matcher matches:@20], @"");
    });
    
    it(@"does not match 21", ^{
        STAssertFalse([matcher matches:@21], @"");
    });
});

SpecEnd
