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

#import "PSTLegislature.h"
#import "PSTLegislation.h"
#import "PSTLawMaking.h"
#import "PSTLegislatureDelegate.h"
#import "PSTEqualityLaw.h"
#import "PSTInvertedLaw.h"

@interface PSTLegislature ()
@property (strong, nonatomic) PSTLegislation *legislation;
@property (strong, nonatomic) id<PSTLawMaking> factory;
@property (strong, nonatomic) id<PSTLegislatureDelegate> delegate;
@end

@implementation PSTLegislature

- (id)initWithLegislation:(PSTLegislation *)legislation factory:(id<PSTLawMaking>)factory delegate:(id<PSTLegislatureDelegate>)delegate
{
    if (self = [self init]) {
        self.legislation = legislation;
        self.factory = factory;
        self.delegate = delegate;
    }
    return self;
}

- (void)beEqualTo:(id)other
{
    PSTLaw *law = [[self factory] beEqualTo:other];
    [[self legislation] addLaw:law];
    [[self delegate] legislature:self didAddLaw:law];
}

- (void)beIdenticalTo:(id)other
{
    PSTLaw *law = [[self factory] beIdenticalTo:other];
    [[self legislation] addLaw:law];
    [[self delegate] legislature:self didAddLaw:law];
}

- (void)beZero
{
}

- (void)bePositive
{
}

- (void)beNegative
{
}

- (void)beGreaterThan:(NSNumber *)number
{
}

- (void)beLessThan:(NSNumber *)number
{
}

- (void)beGreaterThanOrEqualTo:(NSNumber *)number
{
}

- (void)beLessThanOrEqualTo:(NSNumber *)number
{
}

- (void)beBetween:(NSNumber *)low and:(NSNumber *)high
{
}

- (void)beKindOf:(Class)klass
{
}

- (void)beMemberOf:(Class)klass
{
}

@end
