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

#import "PSTPunishment.h"
#import "PSTLaw.h"

@interface PSTPunishment ()
@property (strong, nonatomic) NSString *filename;
@property (strong, nonatomic) NSNumber *lineNumber;
@end

@implementation PSTPunishment

- (id)initWithFilename:(NSString *)filename lineNumber:(NSNumber *)lineNumber
{
    if (self = [self init]) {
        self.filename = filename;
        self.lineNumber = lineNumber;
    }
    return self;
}

- (void)punishSubject:(id)subject forBreakingLaw:(PSTLaw *)law
{
    NSString *explanation = [law explanationForSubject:subject];
    NSException *exception = [[NSException alloc] initWithName:NSInternalInconsistencyException reason:explanation userInfo:nil];
    [exception raise];
}

@end
