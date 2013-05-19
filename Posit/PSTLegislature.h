//
//  Created by Ryan Davies on 18/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PSTLegislation;
@protocol PSTLegislatureDelegate;

@interface PSTLegislature : NSObject

- (id)initWithLegislation:(PSTLegislation *)legislation delegate:(id<PSTLegislatureDelegate>)delegate;

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
