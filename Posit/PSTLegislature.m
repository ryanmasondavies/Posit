//
//  Created by Ryan Davies on 18/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "PSTLegislature.h"
#import "PSTLegislation.h"
#import "PSTLegislatureDelegate.h"
#import "PSTEqualityLaw.h"
#import "PSTInvertedLaw.h"

@interface PSTLegislature ()
@property (strong, nonatomic) PSTLegislation *legislation;
@property (strong, nonatomic) id<PSTLegislatureDelegate> delegate;
@end

@implementation PSTLegislature

- (id)initWithLegislation:(PSTLegislation *)legislation delegate:(id<PSTLegislatureDelegate>)delegate
{
    if (self = [self init]) {
        self.legislation = legislation;
        self.delegate = delegate;
    }
    return self;
}

- (void)beEqualTo:(id)other
{
    id<PSTLaw> law = [[PSTEqualityLaw alloc] initWithObject:other];
    [[self legislation] addLaw:law];
    [[self delegate] legislature:self didAddLaw:law];
}

- (void)beIdenticalTo:(id)other
{
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
