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

#import "PSTInvertedLawFactory.h"
#import "PSTInvertedLaw.h"

@interface PSTInvertedLawFactory ()
@property (strong, nonatomic) id<PSTLawMaking> factory;
@end

@implementation PSTInvertedLawFactory

- (id)initWithFactory:(id<PSTLawMaking>)factory
{
    if (self = [self init]) {
        self.factory = factory;
    }
    return self;
}

- (PSTLaw *)beEqualTo:(id)other
{
    return [[PSTInvertedLaw alloc] initWithLaw:[[self factory] beEqualTo:other]];
}

- (PSTLaw *)beIdenticalTo:(id)other
{
    return [[PSTInvertedLaw alloc] initWithLaw:[[self factory] beIdenticalTo:other]];
}

- (PSTLaw *)beZero
{
    return [[PSTInvertedLaw alloc] initWithLaw:[[self factory] beZero]];
}

- (PSTLaw *)bePositive
{
    return [[PSTInvertedLaw alloc] initWithLaw:[[self factory] bePositive]];
}

- (PSTLaw *)beNegative
{
    return [[PSTInvertedLaw alloc] initWithLaw:[[self factory] beNegative]];
}

- (PSTLaw *)beGreaterThan:(NSNumber *)number
{
    return [[PSTInvertedLaw alloc] initWithLaw:[[self factory] beGreaterThan:number]];
}

- (PSTLaw *)beLessThan:(NSNumber *)number
{
    return [[PSTInvertedLaw alloc] initWithLaw:[[self factory] beLessThan:number]];
}

- (PSTLaw *)beGreaterThanOrEqualTo:(NSNumber *)number
{
    return [[PSTInvertedLaw alloc] initWithLaw:[[self factory] beGreaterThanOrEqualTo:number]];
}

- (PSTLaw *)beLessThanOrEqualTo:(NSNumber *)number
{
    return [[PSTInvertedLaw alloc] initWithLaw:[[self factory] beLessThanOrEqualTo:number]];
}

- (PSTLaw *)beBetween:(NSNumber *)low and:(NSNumber *)high
{
    return [[PSTInvertedLaw alloc] initWithLaw:[[self factory] beBetween:low and:high]];
}

- (PSTLaw *)beKindOf:(Class)klass
{
    return [[PSTInvertedLaw alloc] initWithLaw:[[self factory] beKindOf:klass]];
}

- (PSTLaw *)beMemberOf:(Class)klass
{
    return [[PSTInvertedLaw alloc] initWithLaw:[[self factory] beMemberOf:klass]];
}

@end
