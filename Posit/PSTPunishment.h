//
//  Created by Ryan Davies on 19/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol PSTLaw;

@interface PSTPunishment : NSObject

- (id)initWithFilename:(NSString *)filename lineNumber:(NSNumber *)lineNumber;
- (void)punishSubject:(id)subject forBreakingLaw:(id<PSTLaw>)law;

@end
