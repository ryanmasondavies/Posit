//
//  PSTExpectationMaker.h
//  Posit
//
//  Created by Ryan Davies on 01/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSTExpectationMaker : NSObject

- (id)initWithSubject:(id)subject;

- (id)to;
- (id)notTo;

- (void)beEqualTo:(id)other;

@end
