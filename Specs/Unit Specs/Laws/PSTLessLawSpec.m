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

SpecBegin(PSTLessLaw)

__block PSTLessLaw *law;

when(@"Comparing to 1", ^{
    before(^{
        law = [[PSTLessLaw alloc] initWithNumber:@1];
    });
    
    when(@"subject is 1", ^{
        it(@"is broken", ^{
            STAssertTrue([law isBrokenBySubject:@1], @"");
        });
        
        it(@"explains that 1 is not less than 1", ^{
            STAssertEqualObjects([law explanationForSubject:@1], @"Expected '1' to be less than '1'.", @"");
        });
    });
    
    when(@"subject is 0", ^{
        it(@"is not broken", ^{
            STAssertFalse([law isBrokenBySubject:@0], @"");
        });
    });
    
    when(@"subject is -1", ^{
        it(@"is not broken", ^{
            STAssertFalse([law isBrokenBySubject:@(-1)], @"");
        });
    });
});

when(@"Comparing to 0", ^{
    before(^{
        law = [[PSTLessLaw alloc] initWithNumber:@0];
    });
    
    when(@"subject is 1", ^{
        it(@"is broken", ^{
            STAssertTrue([law isBrokenBySubject:@1], @"");
        });
        
        it(@"explains that 1 is not less than 0", ^{
            STAssertEqualObjects([law explanationForSubject:@1], @"Expected '1' to be less than '0'.", @"");
        });
    });
    
    when(@"subject is 0", ^{
        it(@"is broken", ^{
            STAssertTrue([law isBrokenBySubject:@0], @"");
        });
        
        it(@"explains that 0 is not less than 0", ^{
            STAssertEqualObjects([law explanationForSubject:@0], @"Expected '0' to be less than '0'.", @"");
        });
    });
    
    it(@"is not broken by -1", ^{
        STAssertFalse([law isBrokenBySubject:@(-1)], @"");
    });
});

when(@"Comparing to -1", ^{
    before(^{
        law = [[PSTLessLaw alloc] initWithNumber:@(-1)];
    });
    
    when(@"subject is 1", ^{
        it(@"is broken", ^{
            STAssertTrue([law isBrokenBySubject:@1], @"");
        });
        
        it(@"explains that 1 is not less than -1", ^{
            STAssertEqualObjects([law explanationForSubject:@1], @"Expected '1' to be less than '-1'.", @"");
        });
    });
    
    when(@"subject is 0", ^{
        it(@"is broken", ^{
            STAssertTrue([law isBrokenBySubject:@0], @"");
        });
        
        it(@"explains that 0 is not less than -1", ^{
            STAssertEqualObjects([law explanationForSubject:@0], @"Expected '0' to be less than '-1'.", @"");
        });
    });
    
    when(@"subject is -1", ^{
        it(@"is broken", ^{
            STAssertTrue([law isBrokenBySubject:@(-1)], @"");
        });
        
        it(@"explains that -1 is not less than -1", ^{
            STAssertEqualObjects([law explanationForSubject:@(-1)], @"Expected '-1' to be less than '-1'.", @"");
        });
    });
});

when(@"comparing to 1 and broken by 0", ^{
    it(@"explains that 0 is not less than 1", ^{
        law = [[PSTLessLaw alloc] initWithNumber:@1];
        STAssertEqualObjects([law explanationForSubject:@0], @"Expected '0' to be less than '1'.", @"");
    });
});

SpecEnd
