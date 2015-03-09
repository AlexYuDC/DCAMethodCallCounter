//
//  DCAMethodCallCounter.m
//  
//
//  Created by Alex Yu on 3/9/15.
//  Copyright (c) 2015 no. All rights reserved.
//

#import "DCAMethodCallCounter.h"

@interface DCAMethodCallCounter()

@property (nonatomic, strong) NSMutableDictionary *counterDict;

@end

@implementation DCAMethodCallCounter

+ (DCAMethodCallCounter *)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^
                  {
                      sharedInstance = [self new];
                  });
    return sharedInstance;
}

- (void)callMethed:(NSString *)methodName{
    if (!self.counterDict) {
        self.counterDict = [NSMutableDictionary new];
    }
    
    NSNumber *number = [self.counterDict objectForKey:methodName];
    
    if (!number) {
        [self.counterDict setObject:@0 forKey:methodName];
    } else {
        number = [NSNumber numberWithInteger:[number integerValue] + 1];
        [self.counterDict setObject:number forKey:methodName];
        // NSLog(@"method %@ called %@ times",methodName , number);
    }
}

- (void)printResult
{
    NSLog(@"Method Call Counter Result:\n%@", self.counterDict);
}

@end