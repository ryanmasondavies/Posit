// The MIT License
// 
// Copyright (c) 2013 Ryan Davies
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "PSTBeMatcher.h"

@interface PSTBeMatcher ()
- (SEL)selectorByReplacingPrefix:(NSString *)string1 with:(NSString *)string2 inSelector:(SEL)selector;
@end

@implementation PSTBeMatcher

+ (BOOL)instancesRespondToSelector:(SEL)selector
{
    NSString *methodName = NSStringFromSelector(selector);
    return [methodName hasPrefix:@"be"] && [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[methodName characterAtIndex:2]];
}

- (SEL)selectorByReplacingPrefix:(NSString *)string1 with:(NSString *)string2 inSelector:(SEL)selector
{
    NSString *name = NSStringFromSelector(selector);
    NSRange prefixRange = [name rangeOfString:string1];
    if (prefixRange.location != 0) return selector;
    
    return NSSelectorFromString([name stringByReplacingCharactersInRange:prefixRange withString:string2]);
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    SEL processedSelector = [self selectorByReplacingPrefix:@"be" with:@"is" inSelector:[invocation selector]];
    [invocation setSelector:processedSelector];
    [invocation invokeWithTarget:[self subject]];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    SEL processedSelector = [self selectorByReplacingPrefix:@"be" with:@"is" inSelector:selector];
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
            if (++argumentIndex < [arguments count]) {
                // Do not separate with 'and' if 'and' is already part of the method name:
                NSString *nextWord = [message substringWithRange:NSMakeRange(i + 1, 3)];
                if ([nextWord isEqualToString:@"and"] == NO)
                    replacement = [NSString stringWithFormat:@"%@ and ", replacement];
                else
                    replacement = [NSString stringWithFormat:@"%@ ", replacement];
            }
            
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
