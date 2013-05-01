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

SpecBegin(PSTBeEqualTo)

describe(@"expect 'Foobar' to be equal to 'Foobar'", ^{
    it(@"doesn't throw an exception", ^{
        STAssertNoThrow([[expect(@"Foobar") to] beEqualTo:@"Foobar"], nil);
    });
});

describe(@"expect 'Foobar' to be equal to 'Boofar'", ^{
    it(@"throws an exception with the reason 'Expected 'Foobar' to be equal to 'Barfoo'.'", ^{
        NSException *exception = nil;
        @try { [[expect(@"Foobar") to] beEqualTo:@"Barfoo"]; }
        @catch(NSException *e) { exception = e; };
        STAssertEqualObjects([exception reason], @"Expected 'Foobar' to be equal to 'Barfoo'.", nil);
    });
});

describe(@"expect 'Foobar' not to be equal to 'Foobar'", ^{
    it(@"throws an exception with the reason 'Expected 'Foobar' not to be equal to 'Foobar'.", ^{
        NSException *exception = nil;
        @try { [[expect(@"Foobar") notTo] beEqualTo:@"Foobar"]; }
        @catch(NSException *e) { exception = e; };
        STAssertEqualObjects([exception reason], @"Expected 'Foobar' not to be equal to 'Foobar'.", nil);
    });
});

describe(@"expect 'Foobar' not to be equal to 'Barfoo'", ^{
    it(@"doesn't throw an exception", ^{
        STAssertNoThrow([[expect(@"Foobar") notTo] beEqualTo:@"Barfoo"], nil);
    });
});

SpecEnd
