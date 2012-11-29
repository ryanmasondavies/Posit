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
@property (nonatomic, copy) NSString *filePath;
@property (nonatomic, copy) NSNumber *lineNumber;
@property (nonatomic, strong) PSTMatcher *matcher;
@property (nonatomic, getter=isNegative) BOOL negative;

- (id)initWithSubject:(id)subject;
- (id)initWithSubject:(id)subject filePath:(NSString *)filePath lineNumber:(NSNumber *)lineNumber;

@end

@interface NSObject (PSTExpectation)

- (id)makeExpectationOnLine:(NSNumber *)lineNumber inFile:(NSString *)filePath;
- (id)makeNegativeExpectationOnLine:(NSNumber *)lineNumber inFile:(NSString *)filePath;

@end
