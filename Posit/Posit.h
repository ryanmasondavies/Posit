//
//  Posit.h
//  Posit
//
//  Created by Ryan Davies on 21/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

// Expectations:
#import "PSTExpectation.h"

#define should makeExpectationOnLine:@(__LINE__) inFile:@(__FILE__)
#define shouldNot makeNegativeExpectationOnLine:@(__LINE__) inFile:@(__FILE__)

// Comparison methods:
#import "PSTObjectComparison.h"
#import "PSTBooleanComparison.h"

// Matchers:
#import "PSTBeMatcher.h"
