//
//  Created by Ryan Davies on 20/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PSTLaw;

@protocol PSTLawMaking <NSObject>

- (PSTLaw *)beEqualTo:(id)other;
- (PSTLaw *)beIdenticalTo:(id)other;

- (PSTLaw *)beZero;
- (PSTLaw *)bePositive;
- (PSTLaw *)beNegative;

- (PSTLaw *)beGreaterThan:(NSNumber *)number;
- (PSTLaw *)beLessThan:(NSNumber *)number;
- (PSTLaw *)beGreaterThanOrEqualTo:(NSNumber *)number;
- (PSTLaw *)beLessThanOrEqualTo:(NSNumber *)number;
- (PSTLaw *)beBetween:(NSNumber *)low and:(NSNumber *)high;

- (PSTLaw *)beKindOf:(Class)klass;
- (PSTLaw *)beMemberOf:(Class)klass;

@end
