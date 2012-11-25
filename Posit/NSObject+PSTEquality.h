//
//  NSObject+PSTEquality.h
//  Posit
//
//  Created by Ryan Davies on 25/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PSTEquality)

- (BOOL)isIdentical:(id)object;

- (BOOL)isEqualTo:(id)object;
- (BOOL)isIdenticalTo:(id)object;

@end
