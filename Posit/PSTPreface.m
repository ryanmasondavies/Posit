//
//  Created by Ryan Davies on 19/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "PSTPreface.h"

@interface PSTPreface ()
@property (strong, nonatomic) id to;
@property (strong, nonatomic) id notTo;
@end

@implementation PSTPreface

- (id)initWithTo:(id)to notTo:(id)notTo
{
    if (self = [self init]) {
        self.to = to;
        self.notTo = notTo;
    }
    return self;
}

@end
