//
//  Created by Ryan Davies on 20/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "PSTLawFactory.h"
#import "PSTEqualityLaw.h"

@implementation PSTLawFactory

- (id<PSTLaw>)beEqualTo:(id)other
{
    return [[PSTEqualityLaw alloc] initWithObject:other];
}

- (id<PSTLaw>)beIdenticalTo:(id)other
{
    return nil;
}

- (id<PSTLaw>)beZero
{
    return nil;
}

- (id<PSTLaw>)bePositive
{
    return nil;
}

- (id<PSTLaw>)beNegative
{
    return nil;
}

- (id<PSTLaw>)beGreaterThan:(NSNumber *)number
{
    return nil;
}

- (id<PSTLaw>)beLessThan:(NSNumber *)number
{
    return nil;
}

- (id<PSTLaw>)beGreaterThanOrEqualTo:(NSNumber *)number
{
    return nil;
}

- (id<PSTLaw>)beLessThanOrEqualTo:(NSNumber *)number
{
    return nil;
}

- (id<PSTLaw>)beBetween:(NSNumber *)low and:(NSNumber *)high
{
    return nil;
}

- (id<PSTLaw>)beKindOf:(Class)klass
{
    return nil;
}

- (id<PSTLaw>)beMemberOf:(Class)klass
{
    return nil;
}

@end
