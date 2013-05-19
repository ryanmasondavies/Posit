//
//  Created by Ryan Davies on 19/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSTLegislatureDelegate.h"
@class PSTTrial;

@interface PSTResolution : NSObject <PSTLegislatureDelegate>

- (id)initWithTrial:(PSTTrial *)trial;

@end
