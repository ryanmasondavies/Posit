//
//  PSTBeMatcher.h
//  Posit
//
//  Created by Ryan Davies on 25/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "PSTMatcher.h"

@interface PSTBeMatcher : PSTMatcher
@end

@interface PSTBeMatcher (PSTEquality)

// Object comparison
- (BOOL)beEqualTo:(id)other;
- (BOOL)beIdenticalTo:(id)other;

// Boolean comparison
- (BOOL)beTrue;
- (BOOL)beFalse;

// Class comparison
- (BOOL)beKindOfClass:(Class)klass;
- (BOOL)beMemberOfClass:(Class)klass;

@end
