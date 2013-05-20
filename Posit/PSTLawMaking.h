//
//  Created by Ryan Davies on 20/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol PSTLaw;

@protocol PSTLawMaking <NSObject>

- (id<PSTLaw>)beEqualTo:(id)other;
- (id<PSTLaw>)beIdenticalTo:(id)other;

- (id<PSTLaw>)beZero;
- (id<PSTLaw>)bePositive;
- (id<PSTLaw>)beNegative;

- (id<PSTLaw>)beGreaterThan:(NSNumber *)number;
- (id<PSTLaw>)beLessThan:(NSNumber *)number;
- (id<PSTLaw>)beGreaterThanOrEqualTo:(NSNumber *)number;
- (id<PSTLaw>)beLessThanOrEqualTo:(NSNumber *)number;
- (id<PSTLaw>)beBetween:(NSNumber *)low and:(NSNumber *)high;

- (id<PSTLaw>)beKindOf:(Class)klass;
- (id<PSTLaw>)beMemberOf:(Class)klass;

@end
