//
//  Created by Ryan Davies on 19/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSTPreface : NSObject

- (id)initWithTo:(id)to notTo:(id)notTo;

@property (readonly) id to;
@property (readonly) id notTo;

@end
