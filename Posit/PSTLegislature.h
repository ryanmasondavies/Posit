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

#import <Foundation/Foundation.h>
@class PSTLegislation;
@class PSTLawFactory;
@protocol PSTLegislatureDelegate;

@interface PSTLegislature : NSObject

- (id)initWithLegislation:(PSTLegislation *)legislation factory:(PSTLawFactory *)factory delegate:(id<PSTLegislatureDelegate>)delegate;

- (void)beEqualTo:(id)other;
- (void)beIdenticalTo:(id)other;

- (void)beZero;
- (void)bePositive;
- (void)beNegative;

- (void)beGreaterThan:(NSNumber *)number;
- (void)beLessThan:(NSNumber *)number;
- (void)beGreaterThanOrEqualTo:(NSNumber *)number;
- (void)beLessThanOrEqualTo:(NSNumber *)number;
- (void)beBetween:(NSNumber *)low and:(NSNumber *)high;

- (void)beKindOf:(Class)klass;
- (void)beMemberOf:(Class)klass;

@end
