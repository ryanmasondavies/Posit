//
//  PSTExpectation.h
//  Beehive
//
//  Created by Ryan Davies on 14/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

@class PSTMatcher;

@interface PSTExpectation : NSObject
@property (nonatomic, strong) id subject;
@property (nonatomic, strong) PSTMatcher *matcher;
@property (nonatomic, getter=isNegative) BOOL negative;

- (id)initWithSubject:(id)subject;

@end
