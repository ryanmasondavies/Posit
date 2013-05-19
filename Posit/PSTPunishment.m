//
//  Created by Ryan Davies on 19/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "PSTPunishment.h"
#import "PSTLaw.h"

@interface PSTPunishment ()
@property (strong, nonatomic) NSString *filename;
@property (strong, nonatomic) NSNumber *lineNumber;
@end

@implementation PSTPunishment

- (id)initWithFilename:(NSString *)filename lineNumber:(NSNumber *)lineNumber
{
    if (self = [self init]) {
        self.filename = filename;
        self.lineNumber = lineNumber;
    }
    return self;
}

- (void)punishSubject:(id)subject forBreakingLaw:(id<PSTLaw>)law
{
    NSString *explanation = [law explanationForSubject:subject];
    NSException *exception = [[NSException alloc] initWithName:NSInternalInconsistencyException reason:explanation userInfo:nil];
    [exception raise];
}

@end
