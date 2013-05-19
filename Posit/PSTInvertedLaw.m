//
//  Created by Ryan Davies on 19/05/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "PSTInvertedLaw.h"

@interface PSTInvertedLaw ()
@property (strong, nonatomic) id<PSTLaw> law;
@end

@implementation PSTInvertedLaw

- (id)initWithLaw:(id<PSTLaw>)law
{
    if (self = [self init]) {
        self.law = law;
    }
    return self;
}

- (BOOL)isBrokenBySubject:(id)subject
{
    return ![[self law] isBrokenBySubject:subject];
}

- (NSString *)explanationForSubject:(id)subject
{
    NSString *explanation = [[self law] explanationForSubject:subject];
    NSString *preface = [NSString stringWithFormat:@"Expected '%@' to", subject];
    NSString *invertedPreface = [NSString stringWithFormat:@"Expected '%@' not to", subject];
    return [explanation stringByReplacingOccurrencesOfString:preface withString:invertedPreface];
}

@end
