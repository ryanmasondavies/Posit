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

@interface PSTTestMatcher : PSTMatcher

- (BOOL)successfulMethod;
- (BOOL)successfulMethodWithNull:(id)null1 andNull:(id)null2;
- (BOOL)successfulMethodWithObject:(id)object1 andObject:(id)object2;
- (BOOL)successfulMethodWithClass:(Class)class1 andClass:(Class)class2;
- (BOOL)successfulMethodWithSelector:(SEL)selector1 andSelector:(SEL)selector2;
- (BOOL)successfulMethodWithBoolean:(bool)boolean1 andBoolean:(bool)boolean2;
- (BOOL)successfulMethodWithChar:(char)char1 andChar:(char)char2;
- (BOOL)successfulMethodWithDouble:(double)double1 andDouble:(double)double2;
- (BOOL)successfulMethodWithFloat:(float)float1 andFloat:(float)float2;
- (BOOL)successfulMethodWithInt:(int)int1 andInt:(int)int2;
- (BOOL)successfulMethodWithLong:(long)long1 andLong:(long)long2;
- (BOOL)successfulMethodWithLongLong:(long long)longLong1 andLongLong:(long long)longLong2;
- (BOOL)successfulMethodWithShort:(short)short1 andShort:(short)short2;
- (BOOL)successfulMethodWithUnsignedChar:(unsigned char)unsignedChar1 andUnsignedChar:(unsigned char)unsignedChar2;
- (BOOL)successfulMethodWithUnsignedInt:(unsigned int)unsignedInt1 andUnsignedInt:(unsigned int)unsignedInt2;
- (BOOL)successfulMethodWithUnsignedLong:(unsigned long)unsignedLong1 andUnsignedLong:(unsigned long)unsignedLong2;
- (BOOL)successfulMethodWithUnsignedLongLong:(unsigned long long)unsignedLongLong1 andUnsignedLongLong:(unsigned long long)unsignedLongLong2;
- (BOOL)successfulMethodWithUnsignedShort:(unsigned short)unsignedShort1 andUnsignedShort:(unsigned short)unsignedShort2;

- (BOOL)failureMethod;
- (BOOL)failureMethodWithNull:(id)null1 andNull:(id)null2;
- (BOOL)failureMethodWithObject:(id)object1 andObject:(id)object2;
- (BOOL)failureMethodWithClass:(Class)class1 andClass:(Class)class2;
- (BOOL)failureMethodWithSelector:(SEL)selector1 andSelector:(SEL)selector2;
- (BOOL)failureMethodWithBoolean:(bool)boolean1 andBoolean:(bool)boolean2;
- (BOOL)failureMethodWithChar:(char)char1 andChar:(char)char2;
- (BOOL)failureMethodWithDouble:(double)double1 andDouble:(double)double2;
- (BOOL)failureMethodWithFloat:(float)float1 andFloat:(float)float2;
- (BOOL)failureMethodWithInt:(int)int1 andInt:(int)int2;
- (BOOL)failureMethodWithLong:(long)long1 andLong:(long)long2;
- (BOOL)failureMethodWithLongLong:(long long)longLong1 andLongLong:(long long)longLong2;
- (BOOL)failureMethodWithShort:(short)short1 andShort:(short)short2;
- (BOOL)failureMethodWithUnsignedChar:(unsigned char)unsignedChar1 andUnsignedChar:(unsigned char)unsignedChar2;
- (BOOL)failureMethodWithUnsignedInt:(unsigned int)unsignedInt1 andUnsignedInt:(unsigned int)unsignedInt2;
- (BOOL)failureMethodWithUnsignedLong:(unsigned long)unsignedLong1 andUnsignedLong:(unsigned long)unsignedLong2;
- (BOOL)failureMethodWithUnsignedLongLong:(unsigned long long)unsignedLongLong1 andUnsignedLongLong:(unsigned long long)unsignedLongLong2;
- (BOOL)failureMethodWithUnsignedShort:(unsigned short)unsignedShort1 andUnsignedShort:(unsigned short)unsignedShort2;

@end
