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

#import "PSTCopyableObject.h"

SpecBegin(PSTBeIdenticalTo)

__block PSTCopyableObject *object;
__block PSTCopyableObject *copy;

before(^{
    object = [[PSTCopyableObject alloc] init];
    copy = [object copy];
});

describe(@"expect object to be identical to itself", ^{
    it(@"doesn't throw an exception", ^{
        STAssertNoThrow([[expect(object) to] beIdenticalTo:object], nil);
    });
});

describe(@"expect object to be equal to copy", ^{
    it(@"throws an exception with the reason 'Expected '<copy>' to be identical to '<object>'.'", ^{
        NSException *exception = nil;
        @try { [[expect(object) to] beIdenticalTo:copy]; }
        @catch(NSException *e) { exception = e; };
        NSString *explanation = [NSString stringWithFormat:@"Expected '%@' to be identical to '%@'.", object, copy];
        STAssertEqualObjects([exception reason], explanation, nil);
    });
});

describe(@"expect object not to be equal to itself", ^{
    it(@"throws an exception with the reason 'Expected '<object>' not to be equal to '<object>'.", ^{
        NSException *exception = nil;
        @try { [[expect(object) notTo] beIdenticalTo:object]; }
        @catch(NSException *e) { exception = e; };
        NSString *explanation = [NSString stringWithFormat:@"Expected '%@' not to be identical to '%@'.", object, object];
        STAssertEqualObjects([exception reason], explanation, nil);
    });
});

describe(@"expect object not to be equal to copy", ^{
    it(@"doesn't throw an exception", ^{
        STAssertNoThrow([[expect(object) notTo] beIdenticalTo:copy], nil);
    });
});

SpecEnd
