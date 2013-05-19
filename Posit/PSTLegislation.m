//
//  Created by Ryan Davies on 19/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "PSTLegislation.h"
#import "PSTLaw.h"

@interface PSTLegislation ()
@property (strong, nonatomic) NSMutableArray *laws;
@end

@implementation PSTLegislation

- (id)init
{
    if (self = [super init]) {
        self.laws = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addLaw:(id<PSTLaw>)law
{
    [[self laws] addObject:law];
}

- (NSArray *)lawsBrokenBySubject:(id)subject
{
    NSMutableArray *broken = [[NSMutableArray alloc] init];
    for (id<PSTLaw> law in [self laws]) {
        [broken addObject:law];
    }
    return [broken copy];
}

@end
