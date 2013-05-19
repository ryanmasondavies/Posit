//
//  Created by Ryan Davies on 19/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSTLaw.h"

@interface PSTInvertedLaw : NSObject <PSTLaw>

- (id)initWithLaw:(id<PSTLaw>)law;

@end
