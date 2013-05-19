//
//  Created by Ryan Davies on 19/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "PSTEqualityLaw.h"

@interface PSTEqualityLaw ()
@property (strong, nonatomic) id object;
@end

@implementation PSTEqualityLaw

- (id)initWithObject:(id)object
{
    if (self = [self init]) {
        self.object = object;
    }
    return self;
}

- (BOOL)isBrokenBySubject:(id)subject
{
    return ![subject isEqual:[self object]];
}

- (NSString *)explanationForSubject:(id)subject
{
    return [NSString stringWithFormat:@"Expected '%@' to be equal to '%@'.", subject, [self object]];
}

@end
