//
//  Created by Ryan Davies on 19/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PSTLaw <NSObject>

/** @return A boolean indicating whether or not the subject has broken the law. */
- (BOOL)isBrokenBySubject:(id)subject;

/** @return An explanation of how the subject has broken the law. */
- (NSString *)explanationForSubject:(id)subject;

@end
