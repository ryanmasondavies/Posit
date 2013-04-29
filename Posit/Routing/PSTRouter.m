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

#import "PSTRouter.h"
#import "PSTRouterDelegate.h"

@interface PSTRouter ()
@property (strong, nonatomic) id<PSTRouterDelegate> delegate;
@property (strong, nonatomic) NSArray *routes;
@end

@implementation PSTRouter

- (id)initWithDelegate:(id<PSTRouterDelegate>)delegate routes:(NSArray *)routes
{
    if (self = [self init]) {
        [self setDelegate:delegate];
        [self setRoutes:routes];
    }
    return self;
}

- (id)routeForSelector:(SEL)selector
{
    for (id route in [self routes]) {
        if ([route respondsToSelector:selector]) {
            return route;
        }
    }
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:[self routeForSelector:[invocation selector]]];
    [[self delegate] router:self didRouteInvocation:invocation];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    return [[self routeForSelector:selector] methodSignatureForSelector:selector];
}

@end
