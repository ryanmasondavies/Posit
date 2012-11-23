//
//  SHDExpectation.h
//  Beehive
//
//  Created by Ryan Davies on 14/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

@class SHDMatcher;

@interface SHDExpectation : NSObject
@property (nonatomic, strong) id subject;
@property (nonatomic, strong) SHDMatcher *matcher;
@property (nonatomic, getter=isNegative) BOOL negative;

- (id)initWithSubject:(id)subject;

@end
