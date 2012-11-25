//
//  PSTBeMatcher.m
//  Posit
//
//  Created by Ryan Davies on 25/11/2012.
//  Copyright (c) 2012 Ryan Davies. All rights reserved.
//

#import "PSTBeMatcher.h"

@interface PSTBeMatcher ()
- (SEL)selectorByReplacing:(NSString *)string1 with:(NSString *)string2 inSelector:(SEL)selector;
@end

@implementation PSTBeMatcher

- (SEL)selectorByReplacing:(NSString *)string1 with:(NSString *)string2 inSelector:(SEL)selector
{
    NSMutableString *methodName = [NSMutableString stringWithString:NSStringFromSelector(selector)];
    [methodName replaceOccurrencesOfString:@"be" withString:@"is" options:0 range:NSMakeRange(0, [methodName length])];
    return NSSelectorFromString(methodName);
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation setSelector:[self selectorByReplacing:@"be" with:@"is" inSelector:[invocation selector]]];
    [invocation invokeWithTarget:[self subject]];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    SEL processedSelector = [self selectorByReplacing:@"be" with:@"is" inSelector:selector];
    return [[self subject] methodSignatureForSelector:processedSelector];
}

+ (BOOL)instancesRespondToSelector:(SEL)selector
{
    NSString *methodName = NSStringFromSelector(selector);
    return [methodName hasPrefix:@"be"] && [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[methodName characterAtIndex:2]];
}

@end
