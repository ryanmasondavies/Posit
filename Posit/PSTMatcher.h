//
//  PSTMatcher.h
//  Beehive
//
//  Created by Ryan Davies on 14/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSTMatcher : NSObject
@property (nonatomic, strong) id subject;

- (id)initWithSubject:(id)subject;

- (NSString *)failureMessageForSelector:(SEL)selector arguments:(NSArray *)arguments;
- (NSString *)negativeFailureMessageForSelector:(SEL)selector arguments:(NSArray *)arguments;

@end
