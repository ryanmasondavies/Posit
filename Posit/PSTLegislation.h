//
//  Created by Ryan Davies on 19/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol PSTLaw;

@interface PSTLegislation : NSObject

- (void)addLaw:(id<PSTLaw>)law;

- (NSArray *)lawsBrokenBySubject:(id)subject;

@end
