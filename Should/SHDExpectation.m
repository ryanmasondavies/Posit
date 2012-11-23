//
//  SHDExpectation.m
//  Beehive
//
//  Created by Ryan Davies on 14/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "SHDExpectation.h"
#import "SHDMatcher.h"
#import "SHDMatcherRegistry.h"

@implementation SHDExpectation

- (id)initWithSubject:(id)subject
{
    self = [super init];
    if (self)
        self.subject = subject;
    
    return self;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    BOOL result = NO;
    
    [invocation invokeWithTarget:[self matcher]];
    [invocation getReturnValue:&result];
    
    if (result == [self isNegative]) {
        NSString *reason;
        if ([self isNegative] == NO) {
            reason = [[self matcher] failureMessageForSelector:[invocation selector] arguments:@[]];
        } else {
            reason = [[self matcher] negativeFailureMessageForSelector:[invocation selector] arguments:@[]];
        }
        
        NSException *exception = [[NSException alloc] initWithName:@"SHDMatcherException" reason:reason userInfo:nil];
        [exception raise];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    Class klass = [[SHDMatcherRegistry sharedRegistry] classWhoseInstancesRespondToSelector:selector];
    self.matcher = [[klass alloc] initWithSubject:[self subject]];
    return [[self matcher] methodSignatureForSelector:selector];
}

@end
