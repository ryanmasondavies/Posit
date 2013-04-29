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

#import "PSTMethodDispatcher.h"
#import "PSTMethodDispatcherDelegate.h"

@interface PSTMethodDispatcher ()
@property (strong, nonatomic) NSArray *receivers;
@property (strong, nonatomic) id<PSTMethodDispatcherDelegate> delegate;
@end

@implementation PSTMethodDispatcher

- (id)initWithReceivers:(NSArray *)receivers delegate:(id<PSTMethodDispatcherDelegate>)delegate
{
    if (self = [self init]) {
        [self setReceivers:receivers];
        [self setDelegate:delegate];
    }
    return self;
}

- (id)receiverForSelector:(SEL)selector
{
    for (id receiver in [self receivers]) {
        if ([receiver respondsToSelector:selector]) {
            return receiver;
        }
    }
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:[self receiverForSelector:[invocation selector]]];
    [[self delegate] methodDispatcher:self didDispatchInvocation:invocation];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    return [[self receiverForSelector:selector] methodSignatureForSelector:selector];
}

@end
