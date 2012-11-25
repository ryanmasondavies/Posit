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

+ (BOOL)instancesRespondToSelector:(SEL)selector
{
    NSString *methodName = NSStringFromSelector(selector);
    return [methodName hasPrefix:@"be"] && [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[methodName characterAtIndex:2]];
}

- (SEL)selectorByReplacing:(NSString *)string1 with:(NSString *)string2 inSelector:(SEL)selector
{
    return NSSelectorFromString([NSStringFromSelector(selector) stringByReplacingOccurrencesOfString:string1 withString:string2]);
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

- (NSString *)failureMessageForSelector:(SEL)selector arguments:(NSArray *)arguments
{
    // Skip past 'be', then replace capital letters with their lowercase counterparts and prefix them with a space:
    NSString *methodName = NSStringFromSelector(selector);
    NSMutableString *message = [NSMutableString string];
    for (NSUInteger i = 0; i < [methodName length]; i ++) {
        unichar character = [methodName characterAtIndex:i];
        if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:character]) {
            [message appendString:@" "];
            character = [[[NSString stringWithFormat:@"%C", character] lowercaseString] characterAtIndex:0];
        }
        [message appendFormat:@"%C", character];
    }
    
    // Replace ':' with respective arguments:
    NSUInteger argumentIndex = 0;
    for (NSUInteger i = 0; i < [message length]; i ++) {
        unichar character = [message characterAtIndex:i];
        if (character == ':') {
            // Replace the ':' with the argument (leaving a space for reading purposes):
            NSString *replacement = [NSString stringWithFormat:@" %@", arguments[argumentIndex]];
            
            // Increment the argument index and add a separating string if there are more to append:
            if (++argumentIndex < [arguments count]) replacement = [NSString stringWithFormat:@"%@, and ", replacement];
            
            // Perform the replacement:
            [message replaceCharactersInRange:NSMakeRange(i, 1) withString:replacement];
        }
    }
    
    return [NSString stringWithFormat:@"Expected %@ to %@.", [self subject], message];
}

- (NSString *)negativeFailureMessageForSelector:(SEL)selector arguments:(NSArray *)arguments
{
    NSString *failureMessage = [self failureMessageForSelector:selector arguments:arguments];
    NSString *needle = [NSString stringWithFormat:@"Expected %@ to", [self subject]];
    NSString *replacement = [NSString stringWithFormat:@"Expected %@ not to", [self subject]];
    return [failureMessage stringByReplacingOccurrencesOfString:needle withString:replacement];
}

@end
