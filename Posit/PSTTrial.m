//
//  Created by Ryan Davies on 19/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "PSTTrial.h"
#import "PSTLaw.h"
#import "PSTLegislation.h"
#import "PSTPunishment.h"

@interface PSTTrial ()
@property (strong, nonatomic) id subject;
@property (strong, nonatomic) PSTLegislation *legislation;
@property (strong, nonatomic) PSTPunishment *punishment;
@end

@implementation PSTTrial

- (id)initWithSubject:(id)subject legislation:(PSTLegislation *)legislation punishment:(PSTPunishment *)punishment
{
    if (self = [self init]) {
        self.subject = subject;
        self.legislation = legislation;
        self.punishment = punishment;
    }
    return self;
}

- (void)resolve
{
    NSArray *brokenLaws = [[self legislation] lawsBrokenBySubject:[self subject]];
    for (id<PSTLaw> law in brokenLaws) {
        [[self punishment] punishSubject:[self subject] forBreakingLaw:law];
    }
}

@end
