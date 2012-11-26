//
//  PSTNumberComparison.h
//  Posit
//
//  Created by Ryan Davies on 26/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (PSTNumberComparison)

- (BOOL)isZero;
- (BOOL)isPositive;
- (BOOL)isNegative;

- (BOOL)isGreaterThan:(NSNumber *)number;
- (BOOL)isLessThan:(NSNumber *)number;

- (BOOL)isGreaterThanOrEqualTo:(NSNumber *)number;
- (BOOL)isLessThanOrEqualTo:(NSNumber *)number;

- (BOOL)isBetween:(NSNumber *)start and:(NSNumber *)end;

@end
