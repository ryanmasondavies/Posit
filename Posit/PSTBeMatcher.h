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

- (BOOL)beEqualTo:(id)other;

@end
