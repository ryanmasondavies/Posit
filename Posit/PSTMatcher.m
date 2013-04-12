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

#import "PSTMatcher.h"
#import <objc/runtime.h>

@interface NSObject (PSTHierarchy)
+ (NSArray *)subclasses;
@end

@implementation NSObject (PSTHierarchy)

+ (NSArray *)subclasses
{
    int numberOfClasses = objc_getClassList(NULL, 0);
    Class *classes = NULL;
    
    if (numberOfClasses > 0) {
        NSMutableArray *subclasses = [NSMutableArray array];
        
        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numberOfClasses);
        numberOfClasses = objc_getClassList(classes, numberOfClasses);
        
        for (int i = 0; i < numberOfClasses; i++) {
            if (class_getSuperclass(classes[i]) == [self class]) {
                [subclasses addObject:classes[i]];
            }
        }
        
        free(classes);
        
        return subclasses;
    }
    
    return nil;
}

@end

@implementation PSTMatcher

+ (Class)subclassWhoseInstancesRespondToSelector:(SEL)selector
{
    NSArray *subclasses = [PSTMatcher subclasses];
    
    NSUInteger indexOfClass = [subclasses indexOfObjectPassingTest:^BOOL(Class klass, NSUInteger idx, BOOL *stop) {
        return [klass instancesRespondToSelector:selector];
    }];
    
    return [subclasses objectAtIndex:indexOfClass];
}

- (id)initWithSubject:(id)subject
{
    if (self = [super init]) self.subject = subject;
    return self;
}

- (NSString *)failureMessageForSelector:(SEL)selector arguments:(NSArray *)arguments
{
    return nil;
}

- (NSString *)negativeFailureMessageForSelector:(SEL)selector arguments:(NSArray *)arguments
{
    return nil;
}

@end
