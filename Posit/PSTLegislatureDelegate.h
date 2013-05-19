//
//  Created by Ryan Davies on 19/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PSTLegislature;
@protocol PSTLaw;

@protocol PSTLegislatureDelegate <NSObject>

- (void)legislature:(PSTLegislature *)legislature didAddLaw:(id<PSTLaw>)law;

@end
