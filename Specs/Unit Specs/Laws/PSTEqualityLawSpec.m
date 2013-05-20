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

SpecBegin(PSTEqualityLaw)

__block PSTLaw law;

when(@"Equating to @TRUE", ^{
    before(^{
        law = [[PSTEqualityLaw alloc] initWithObject:@TRUE];
    });
    
    it(@"is broken by @FALSE", ^{
        STAssertTrue([law isBrokenBySubject:@FALSE], @"");
    });
    
    it(@"is not broken by @TRUE", ^{
        STAssertFalse([law isBrokenBySubject:@TRUE], @"");
    });
});

when(@"Equating to 'Foobar'", ^{
    before(^{
        law = [[PSTEqualityLaw alloc] initWithObject:@"Foobar"];
    });
    
    it(@"is broken by 'Barfoo'", ^{
        STAssertTrue([law isBrokenBySubject:@"Barfoo"], @"");
    });
    
    it(@"is not broken by 'Foobar'", ^{
        STAssertFalse([law isBrokenBySubject:@"Foobar"], @"");
    });
});

when(@"Equating to 20", ^{
    before(^{
        law = [[PSTEqualityLaw alloc] initWithObject:@20];
    });
    
    it(@"is broken by @21", ^{
        STAssertTrue([law isBrokenBySubject:@21], @"");
    });
    
    it(@"is not broken by @20", ^{
        STAssertFalse([law isBrokenBySubject:@20], @"");
    });
});

SpecEnd
