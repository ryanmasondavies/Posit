//
//  Created by Ryan Davies on 19/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PSTLegislation;
@class PSTPunishment;

@interface PSTTrial : NSObject

- (id)initWithSubject:(id)subject legislation:(PSTLegislation *)legislation punishment:(PSTPunishment *)punishment;

- (void)resolve;

@end
