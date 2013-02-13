Posit
=====

An Objective-C expectation framework based on the 'should' terminology.

All arguments and return types must be provided as objects. This has been made significantly easier by the introduction of literals for the most common data types.

This library is a work in progress, and so the API may be subject to simplification and potentially drastic change.

Matchers
========

Posit provides matchers in the format of [[subject should] ...], allowing for more readable examples. The default matchers provided are as follows:

    // Existence:
    [[object should] beNil];
    [[object should] bePresent];
    
    // Equality:
    [[@(1+2) should] beEqualTo:@3];
    [[object should] beIdenticalTo:anotherObject];
    
    // Booleans:
    [[@true should] beTrue];
    [[@false should] beFalse];
    [[@YES should] beYes];
    [[@NO should] beNo];
    
    // Numbers:
    [[@0 should] beZero];
    [[@1 should] bePositive];
    [[@(-1) should] beNegative];
    [[@6 should] beGreaterThan:@5];
    [[@5 should] beLessThan:@6];
    [[@6 should] beGreaterThanOrEqualTo:@5];
    [[@5 should] beLessThanOrEqualTo:@6];
    [[@5 should] beBetween:@1 and:@10];
    
    // Objects:
    [[object should] beKindOf:[NSObject class]];
    [[object should] beMemberOf:[NSObject class]];
    [[object should] conformToProtocol:@protocol(NSCoding)];
    [[object should] respondToSelector:@selector(description)];
    
    // Collections:
    [[pets should] beEmpty];
    [[pets should] haveObject:cat];
    [[pets should] haveObjects:@[cat, dog]];

In order to negate a matcher, either of the following is valid:

    [[@(1+1) shouldNot] beEqualTo:@3];
    [[[@(1+1) should] not] beEqualTo:@3];
    
Use whichever you prefer.

Some of the matchers listed above work based on the dynamic behaviour of Posit - if no matcher exists with the provided selector, the library will attempt to realize the behaviour that you intended, based on convention. If the matcher provided begins with 'be', 'be' will be swapped out for 'is' and attempt to call a method with the generated selector on the subject. For example, 'beEqualTo:' calls 'isEqualTo:' has no matcher – instead, Posit calls 'beEqualTo:' on the subject, providing the expected behaviour.

Before calling a custom method, however, the compiler must know of its existence. This is achieved as follows:

    PSTAddMatcher(beSwitchedOn);
    PSTAddMatcher(beValidWhenComparedTo:(id)object);

Installation
============

Posit can be installed using CocoaPods. Add `pod 'Posit'` to your Podfile.

License
=======

    Copyright (c) 2012 Ryan Davies
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
