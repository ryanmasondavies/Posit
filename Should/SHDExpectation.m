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
    if (self) self.subject = subject;
    return self;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    BOOL result = NO;
    
    [invocation invokeWithTarget:[self matcher]];
    [invocation getReturnValue:&result];
    
    if (result == [self isNegative]) {
        NSMethodSignature *signature = [invocation methodSignature];
        NSMutableArray *arguments = [NSMutableArray array];
        
        for (NSUInteger index = 2; index < [signature numberOfArguments]; index ++) {
            // Retrieve the argument type:
            const char *type = [signature getArgumentTypeAtIndex:index];
            
            // Retrieve the argument size:
            NSUInteger size;
            NSGetSizeAndAlignment(type, &size, NULL);
            
            // Retrieve the value:
            void *buffer = malloc(size);
            [invocation getArgument:buffer atIndex:index];
            
            // Convert it into an object:
            id __autoreleasing object;
            switch (type[0]) {
                case '@': object = *(id __autoreleasing *)buffer; break;
                case '#': object = *(Class __autoreleasing *)buffer; break;
                case ':': object = NSStringFromSelector(*(SEL *)buffer); break;
                
                case 'c': object = [NSNumber numberWithChar:*(char *)buffer]; break;
                case 'd': object = [NSNumber numberWithDouble:*(double *)buffer]; break;
                case 'f': object = [NSNumber numberWithFloat:*(float *)buffer]; break;
                case 'i': object = [NSNumber numberWithInt:*(int *)buffer]; break;
                case 'l': object = [NSNumber numberWithLong:*(long *)buffer]; break;
                case 'q': object = [NSNumber numberWithLongLong:*(long long *)buffer]; break;
                case 's': object = [NSNumber numberWithShort:*(short *)buffer]; break;
                
                case 'B': object = [NSNumber numberWithBool:*(bool *)buffer]; break;
                case 'C': object = [NSNumber numberWithUnsignedChar:*(unsigned char *)buffer]; break;
                case 'I': object = [NSNumber numberWithUnsignedInt:*(unsigned int *)buffer]; break;
                case 'L': object = [NSNumber numberWithUnsignedLong:*(unsigned int *)buffer]; break;
                case 'Q': object = [NSNumber numberWithUnsignedLongLong:*(unsigned int *)buffer]; break;
                case 'S': object = [NSNumber numberWithUnsignedShort:*(unsigned short *)buffer]; break;
            }
            
            // If the argument was nil, represent it as [NSNull null]:
            if (object == nil) object = [NSNull null];
            
            // Free up the buffer we used for the pointer:
            free(buffer);
            
            // Add the object to the arguments array:
            [arguments addObject:object];
        }
        
        NSString *reason;
        if ([self isNegative] == NO)
            reason = [[self matcher] failureMessageForSelector:[invocation selector] arguments:arguments];
        else
            reason = [[self matcher] negativeFailureMessageForSelector:[invocation selector] arguments:arguments];
        
        [NSException raise:@"SHDMatcherException" format:reason, nil];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    Class klass = [[SHDMatcherRegistry sharedRegistry] classWhoseInstancesRespondToSelector:selector];
    self.matcher = [[klass alloc] initWithSubject:[self subject]];
    return [[self matcher] methodSignatureForSelector:selector];
}

@end
