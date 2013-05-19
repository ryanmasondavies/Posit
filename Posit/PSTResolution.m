//
//  Created by Ryan Davies on 19/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "PSTResolution.h"
#import "PSTTrial.h"
#import "PSTLaw.h"

@interface PSTResolution ()
@property (strong, nonatomic) PSTTrial *trial;
@end

@implementation PSTResolution

- (id)initWithTrial:(PSTTrial *)trial
{
    if (self = [self init]) {
        self.trial = trial;
    }
    return self;
}

- (void)legislature:(PSTLegislature *)legislature didAddLaw:(id<PSTLaw>)law
{
    [[self trial] resolve];
}

@end
